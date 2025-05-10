from django.urls import path,re_path

from .views import *  # Import all views from your app


import inspect

import tplcapp.views  # Replace `dockapp` with your actual app name

from django.http import HttpResponse

from django.conf import settings

from django.conf.urls.static import static



# Static urlpatterns

urlpatterns = [



    path('register/', register_view, name='register'),

    path('login/', login_view, name='login'),

    path('logout/', logout_view, name='logout'),

    path('', login_view, name="login"),

    # path('', login, name="login"),

    # path('logout', logout, name="logout"),

    path('home', home, name="home"),

    path('member_registration_form', member_registration_form, name="member_registration_form"),

    # path('doctor_registration/', doctor_registration, name="doctor_registration"),

    re_path(r'^doctor_registration/(?P<action>create|edit)(?:/(?P<id>\d+))?/$', doctor_registration, name='doctor_registration'),

    re_path(r'^hospital_and_nursing_home_reg/(?P<action>create|edit)(?:/(?P<id>\d+))?/$', hospital_and_nursing_home_reg, name='hospital_and_nursing_home_reg'),



    re_path(r'^diagnostic_centre_reg/(?P<action>create|edit)(?:/(?P<id>\d+))?/$', diagnostic_centre_reg, name='diagnostic_centre_reg'),

    # re_path(r'diagnostic_centre_reg/(?P<action>\w+)/(?P<ids>(.*)+|)$', diagnostic_centre_reg,name='diagnostic_centre_reg'),   

    # re_path(r'^diagnostic_centre_reg/(?P<action>)/$', diagnostic_centre_reg, name='diagnostic_centre_reg_create'),

    # re_path(r'^diagnostic_centre_reg/(?P<action>edit)/(?P<id>\d+)/$', diagnostic_centre_reg, name='diagnostic_centre_reg_edit'),

    

    

    # path('hospital_and_nursing_home_reg/' , hospital_and_nursing_home_reg, name="hospital_and_nursing_home_reg"),

    # path('diagnostic_centre_reg/' , diagnostic_centre_reg, name="diagnostic_centre_reg"),



    path('doctor_registration_details/<id>', doctor_registration_details, name="doctor_registration_details"),

    # path('hospital_and_nursing_home_preview/<id>' , hospital_and_nursing_home_preview, name="hospital_and_nursing_home_preview"),

    # path('diagnostic_centre_preview<id>/' , diagnostic_centre_preview, name="diagnostic_centre_preview"),

    path('doctor_registration_list/' , doctor_registration_list, name="doctor_registration_list"),

    path('payment_form_details/' , payment_form_details, name="payment_form_details"),

    path('payment_list/' , payment_list, name="payment_list"),

    path('payment_add_new/' , payment_add_new, name="payment_add_new"),

    path('payment_view/<id>' , payment_view, name="payment_view"),

    path('hospital_and_nursing_home_list/' , hospital_and_nursing_home_list, name="hospital_and_nursing_home_list"),

    path('diagnostic_centre_reg_list/' , diagnostic_centre_reg_list, name="diagnostic_centre_reg_list"),

    path('hospital_and_nursing_home_details/<id>' , hospital_and_nursing_home_details, name="hospital_and_nursing_home_details"),

    path('diagnostic_centre_reg_details/<id>' , diagnostic_centre_reg_details, name="diagnostic_centre_reg_details"),

    path('test/' , test, name="test"),

    path('dynamic_list/<id>' , dynamic_list, name="dynamic_list"),

    path('leads/' , leads, name="leads"),

    path('login/' , login, name="login"),

    path('addeditLeads/' , addeditLeads, name="addeditLeads"),

    path('proposal_view1/', proposal_view1, name="proposal_view1"),



    path('leads_list/' , leads_list, name="leads_list"),

    re_path(r'^lead_reg/(?P<action>create|edit)(?:/(?P<id>\d+))?/$', lead_reg, name='lead_reg'),

    path('lead_reg_details/<id>', lead_reg_details, name="lead_reg_details"),

    path('appointment_list/', appointment_list, name="appointment_list"),

    path('proposal_list/', proposal_list, name="proposal_list"),
    path('leads_report/', leads_report, name="leads_report"),
    path('query/', query, name="query"),
    path('advocate/', advocate, name="advocate"),
    path('case_detail/', case_detail, name="case_detail"),
    # re_path(r'^proposal_reg/(?P<action>create|edit)(?:/(?P<id>\d+))?/$', proposal_reg, name='proposal_reg'),

    re_path(r'^proposal_registration/(?P<action>create|edit)(?:/(?P<id>\d+))?/$', proposal_registration, name='proposal_registration'),

    path('proposal_registration_details/<id>/', proposal_registration_details, name="proposal_registration_details"),
    path('menu_permission/', menu_permission, name="menu_permission"),
    path('menu_permission_ajax/', menu_permission_ajax, name="menu_permission_ajax"),
    path('terminal/', terminal, name="terminal"),
]



urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)





"""

# Function to get all view functions from views.py

def get_view_functions():

    # Retrieve all callable functions from the `views` module

    view_functions = []

    for name, obj in inspect.getmembers(dockapp.views):

        if inspect.isfunction(obj) and not name.startswith("_"):  # Exclude private functions

            view_functions.append(name)

    return view_functions



# Function to generate dynamic URLs

def generate_dynamic_urls():

    dynamic_urls = []



    # Get all function names from views.py

    dynamic_data = get_view_functions()



    # Generate a URL pattern for each function name

    for func_name in dynamic_data:

        # Dynamically get the actual function reference from the module

        func_ref = getattr(dockapp.views, func_name)

        dynamic_urls.append(

            path(f"{func_name}/", func_ref, name=f"{func_name}")

        )



    return dynamic_urls



# Append dynamic URLs to urlpatterns

urlpatterns += generate_dynamic_urls()



# Optional: Print urlpatterns to verify

def print_urlpatterns(urlpatterns):

    output = "urlpatterns = [\n"

    for pattern in urlpatterns:

        # Extract the route, view function, and name for each URL pattern

        route = pattern.pattern.describe()

        view = pattern.callback.__name__

        name = pattern.name

        output += f"    path('{route}', {view}, name=\"{name}\"),\n"

    output += "]"

    return output



# Print the urlpatterns

# print(print_urlpatterns(urlpatterns))

"""