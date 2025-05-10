from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from django.shortcuts import render,redirect 

import socket

from tplcapp.models import MenuItem, UserMenuMapping



def pagination(request,data_list,no_of_records):

    paginator = Paginator(data_list, no_of_records)

    

    page = request.GET.get('page')

    try:

        page_object = paginator.page(page)

    except PageNotAnInteger:

        page_object = paginator.page(1)

    except EmptyPage:

        page_object = paginator.page(paginator.num_pages)

     

    return page_object







def table_body_gen(data_list, model,html_table_header):

    # Start building the table body

    table_body = "<tbody><tr>"

    for th in html_table_header:

        table_body += f"<td>{th}</td>"

    table_body += f"<tr>"

    for index, data in enumerate(data_list, start=1):

        table_body += f"<tr><td>{index}</td>"  # Add Serial Number



        for field in model._meta.fields:

            field_name = field.name

            if field_name in ['id', 'created_at', 'updated_at']:

                continue  # Skip these fields

            field_type = field.get_internal_type()



            # Access the field value

            field_value = getattr(data, field_name)



            # Check for the field type and generate the appropriate <td>

            if field_type in ['CharField', 'TextField', 'IntegerField']:

                table_body += f"<td>{field_value}</td>"

            elif field_type in ['FileField', 'ImageField']:

                # Display as image or link if a file exists

                if field_value:

                    table_body += f"<td><img src='/uploads/{field_value}' alt='{field_name}' style='width: 100px; height: auto;'></td>"

                else:

                    table_body += f"<td>No File</td>"

            elif field_type in ['URLField']:

                   table_body += f"<td><a href='/media/{field_value}' >Click</a></td>"



            else:

                # For any other field types, just display the value

                table_body += f"<td>{field_value}</td>"



        table_body += "</tr>"

    

    table_body += "</tbody>"

    return table_body





# def login_req(func):

#     def wrapper(request, *args, **kwargs):

#         # Check if user is logged in by checking session

#         if request.session.get('user_id'):

#             # If logged in, call the original view

#             return func(request, *args, **kwargs)

#         else:

#             # If not logged in, redirect to login page

#             return redirect('/login')

#     return wrapper





def login_req(function):

    def wrapper(request, *args, **kwargs):

        if not request.user.is_authenticated:

            return redirect('/login')

        return function(request, *args, **kwargs)

    return wrapper



def is_connected_to_internet():

    try:

        # Attempt to connect to a known reliable DNS server (Google DNS)

        socket.create_connection(("8.8.8.8", 53), timeout=3)

        return True

    except OSError:

        return False

    

def get_menu(user_id):

    """ Retrieve all top-level menu items assigned to a user and format them as a nested dictionary """

    


    # Fetch all menu IDs assigned to the user

    user_menu_ids = set(UserMenuMapping.objects.filter(user_id=user_id).values_list("menu_id", flat=True))

    

    # Fetch all menu items in a single query

    menu_items = MenuItem.objects.filter(id__in=user_menu_ids).select_related("parent").order_by("order")

    

    # Create a dictionary to store menu items by their parent ID

    menu_dict = {item.id: item for item in menu_items}

    

    # Create a dictionary to store children of each menu item

    children_map = {}

    for item in menu_items:

        if item.parent_id:  # If the item has a parent

            children_map.setdefault(item.parent_id, []).append(item)

    

    def build_menu(item):

        """ Recursively build menu structure """

        submenu = [build_menu(child) for child in children_map.get(item.id, [])]

        menu_item = {

            "title": item.title,

            "icon": item.icon,

            "url": item.url if item.url else None,

            "submenu": submenu if submenu else None,

        }

        return menu_item



    # Get top-level menu items (parent is null)

    top_level_items = [item for item in menu_items if item.parent_id is None]

    

    return [build_menu(item) for item in top_level_items]





# def get_menu(user_id):

#     """ Retrieve all top-level menu items assigned to a user and format them as a nested dictionary """

#     from tplcapp.models import MenuItem, UserMenuMapping



#     def build_menu(item, user_menu_ids):

#         """ Recursively build menu structure """

#         submenu = [build_menu(child, user_menu_ids) for child in item.children.filter(id__in=user_menu_ids)]

        

#         menu_item = {

#             "title": item.title,

#             "icon": item.icon,

#         }

#         if item.url:

#             menu_item["url"] = item.url

#         if submenu:

#             menu_item["submenu"] = submenu

#         return menu_item



#     # Get menu IDs assigned to the user

#     user_menu_ids = UserMenuMapping.objects.filter(user=user_id).values_list("menu", flat=True)



#     # Get top-level menu items assigned to the user

#     top_level_items = MenuItem.objects.filter(parent__isnull=True, id__in=user_menu_ids).order_by("order")



#     return [build_menu(item, user_menu_ids) for item in top_level_items]

