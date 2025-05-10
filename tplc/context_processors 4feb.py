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
            'COMPANY_TAG_LINE':""
            }