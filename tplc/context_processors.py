def get_menu():
    """ Retrieve all top-level menu items and format them as a nested dictionary """
    from tplcapp.models import MenuItem

    def build_menu(item):
        """ Recursively build menu structure """
        submenu = [build_menu(child) for child in item.children.all()]
        menu_item = {
            "title": item.title,
            "icon": item.icon,
        }
        if item.url:
            menu_item["url"] = item.url
        if submenu:
            menu_item["submenu"] = submenu
        return menu_item

    top_level_items = MenuItem.objects.filter(parent__isnull=True).order_by("order")
    return [build_menu(item) for item in top_level_items]

print(get_menu())

def global_variable(request):
    current_url = request.get_full_path()  # or request.path for just the path without query parameters
    # print(current_url)
    current_url = current_url.replace('_', ' ')
    return {
            # 'company_email': 'pksklcandbcsl@gmail.com',
            # 'company_contact_no': '9474106988',
            # 'company_address': 'At-Kotshila Gour Mahato Building Hospital More, P.O.- Jiudaru, P.S.- Kotshila, Dist- Purulia West Bengal',
            'current_url' :  current_url.upper().strip('/'),  # Add current_url to the context
            # 'registration_no':'0014014910042024',
            # 'GST_NO':'19AAMAP9817F177',
            # 'PAN_NO':'AAMAP98177',
            'COMPANY_NAME':'TRUE PATH LEGAL CONSULTANT',
            'CIN':'U68200JH2023PTC020652',
            'PAN':'AAKCK2953K',
            'TAN':'RCHKO2185B',
            'MOBILE_NO1':'+91 8789919199',
            'MOBILE_NO2':'+91 7294911817',
            'WEBSITE_URL':'www.sabestianagro.com',
            'COMPANY_ADDRESS':'Plot No. 3195, Bandh Kocha (Near Forest Department), Mohilong, Ranchi, JH-835103',
            'COMPANY_TAG_LINE':"",
            "ASIDE_MENU": get_menu()
            }