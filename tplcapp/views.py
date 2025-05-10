from django.shortcuts import render,redirect,get_object_or_404
from .forms import *
from django.utils.timezone import now  # Import Django's timezone utility
from .utilities import login_req ,get_menu
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from django.http import JsonResponse
import json



def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('home')
        else:
            print(form.errors)
    else:
        form = CustomUserCreationForm()
    return render(request, 'register.html', {'form': form})

# def login_view(request):
#     if request.method == 'POST':
#         form = CustomAuthenticationForm(data=request.POST)
#         if form.is_valid():
#             user = form.get_user()
#             login(request, user)
#             request.session['menudict_by_user']=get_menu(request.user.id)
#             return redirect('home')
#     else:
#         form = CustomAuthenticationForm()
#     return render(request, 'login.html', {'form': form})

def login_view(request):
    if request.method == "POST":
        form = CustomAuthenticationForm(request, data=request.POST)  # Corrected instantiation
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            request.session["menudict_by_user"] = get_menu(user.id)  # Use 'user' directly
            return redirect("home")
    else:
        form = CustomAuthenticationForm()
    
    return render(request, "login.html", {"form": form})

def logout_view(request):
    logout(request)
    return redirect('home')

@login_req
def home(request):
    return render(request, 'home1.html')



# @login_req
# def home(request):
#     return render(request,'home1.html')

@login_req
def leads(request):
    return render(request,'leads.html')

#https://prescriibe.com/docland/admin/leads/addeditLeads
@login_req
def addeditLeads(request):
    return render(request,'addeditLeads.html')

#https://prescriibe.com/docland/admin/appointment
@login_req
def appointment(request):
    return render(request,'appointment.html')


#https://prescriibe.com/docland/admin/leads_report
@login_req
def leads_report(request):
    return render(request,'leads_report.html')

#https://prescriibe.com/docland/admin/attendance_report  #loc
@login_req
def attendance_report(request):
    return render(request,'attendance_report.html')

#https://prescriibe.com/docland/admin/proposal
@login_req
def proposal(request):
    return render(request,'proposal.html')

#https://prescriibe.com/docland/admin/proposal/addeditProposal
@login_req
def addeditProposal(request):
    return render(request,'addeditProposal.html')

#https://prescriibe.com/docland/admin/member/payment_form_list
@login_req
def payment_form_list(request):
    return render(request,'payment_form_list.html')

#https://prescriibe.com/docland/admin/member/payment_form_details
@login_req
def payment_form_details(request):
    return render(request,'payment_form_details.html')

#https://prescriibe.com/docland/admin/member/ShowMIS
@login_req
def ShowMIS(request):
    return render(request,'ShowMIS.html')

#https://prescriibe.com/docland/admin/member/businessReport
@login_req
def businessReport(request):
    return render(request,'businessReport.html')

#https://prescriibe.com/docland/admin/advocate
@login_req
def advocate(request):
    return render(request,'advocate.html')

#https://prescriibe.com/docland/admin/advocate/case_detail
@login_req
def case_detail(request):
    return render(request,'case_detail.html')

#https://prescriibe.com/docland/admin/query
@login_req
def query(request):
    return render(request,'query.html')


#https://prescriibe.com/docland/admin/query/add
@login_req
def queryadd(request):
    return render(request,'queryadd.html')


#https://prescriibe.com/docland/admin/contact
@login_req
def contact(request):
    return render(request,'contact.html')



#######################################
@login_req
def member_registration_form(request):
    return render(request,'form/member_registration_form.html')

@login_req
def form(request):
    return render(request,'form/form.html')


def function_to_filter_data_by_user_logged(request):
    user = request.user
    filter_param = {'status__in': [1, 2]}

    if not user.is_superuser:
        filter_param['user_id'] = user.id

    return filter_param

@login_required
def doctor_registration_list(request):
    filter_param = function_to_filter_data_by_user_logged(request)
    print(filter_param)
    doctor_list = DoctorRegistration.objects.filter(**filter_param)
    return render(request, 'doctor_registration_list.html', {'doctor_list': doctor_list})

def proposal_view1(request):
    # doctor_list= DoctorRegistration.objects.all()
    return render(request, 'proposal_view1.html', )



######################################################
# def doctor_registration(request):
#     if request.method == "POST":
#         form = DoctorRegistrationForm(request.POST, request.FILES)  # Pass POST data and FILES
#         if form.is_valid():
#             saved_instance = form.save()  # Save the form and get the instance
#             print("### Data saved successfully ###")
#             # Redirect to the preview page with the instance ID
#             return redirect(f"/doctor_registration_preview/{saved_instance.id}")
#         else:
#             print("### Error in form submission ###")
#             print(form.errors)  # Print form errors for debugging
#     else:
#         form = DoctorRegistrationForm()  # Instantiate an empty form for GET request

#     return render(request, 'doctor_registration.html', {'form': form})

# @login_req
# def doctor_registration(request):
#     latest_member = DoctorRegistration.objects.last()
#     if latest_member:
#         # Get the latest app_registraction_no (assuming it's in the format 'TPD<Number>')
#         split_number_part = latest_member.app_registraction_no[3:]  # Remove 'TPD' prefix
#         split_number_part = int(split_number_part)  # Convert to integer
#         # Increment the number part
#         split_number_part += 1
#         # Format the new app_registraction_no with leading zeros
#         app_registraction_no = f"TPD{split_number_part:06d}"  # Pad with zeros to 6 digits
#     else:
#         # If no records exist, start with 'TPD001000'
#         app_registraction_no = "TPD001000"
#     if request.method == "POST":
#         form = DoctorRegistrationForm(request.POST, request.FILES)  # Pass POST data and FILES
        
#         insurance_cover = request.POST.get('insurance_cover')  # Safely fetch the value
#         # Dynamically adjust field validation
#         if insurance_cover == 'No':
#             form.fields['coverage_amount'].required = False
#         # Check if the form is submitted for saving
#         if 'submit' in request.POST:
#             if form.is_valid():
#                 saved_instance = form.save(commit=False)  # Save the form and get the instance
#                 saved_instance.app_registraction_no= app_registraction_no
#                 saved_instance.created_at= now()
#                 saved_instance.save()
#                 print("### Data saved successfully ###")
#                 return redirect(f"/doctor_registration_details/{saved_instance.id}")
#             else:
#                 print("### Error in form submission ###")
#                 print(form.errors)  # Print form errors for debugging
#                 return render(request, 'doctor_registration.html', {'form': form, 'errors': form.errors})
#     else:
#         # Handle GET request: Instantiate an empty form
#         form = DoctorRegistrationForm()

#     return render(request, 'doctor_registration.html', {'form': form,'app_registraction_no':app_registraction_no})




def doctor_registration(request, action, id=None):
    record = None  # Initialize record as None
    form = None  # Initialize form as None
    app_registraction_no=''
    if action == "create":
        # Generate the next app_registration_no
        latest_member = DoctorRegistration.objects.last()
        print(latest_member.app_registraction_no)
        if latest_member:
            # Assuming the format is 'TPD<Number>'
            split_number_part = int(latest_member.app_registraction_no[3:])  # Extract number part
            app_registraction_no = f"TPD{split_number_part + 1:06d}"  # Increment and pad with zeros
        else:
            app_registraction_no = "TPD001000"  # Start with this if no records exist

        form = DoctorRegistrationForm(request.POST or None, request.FILES or None)

    elif action == "edit":
        # Fetch the existing record or return a 404
        record = get_object_or_404(DoctorRegistration, id=id)
        app_registraction_no = record.app_registraction_no  # Retain existing registration number

        form = DoctorRegistrationForm(request.POST or None, request.FILES or None, instance=record)

    else:
        return redirect('error_page')  # Redirect to a suitable error page for invalid actions

    # Handle form submission
    if request.method == 'POST':
        # Dynamically adjust field requirements based on input
        insurance_cover = request.POST.get('insurance_cover', '')  # Fetch value safely
        if insurance_cover == 'No':
            form.fields['coverage_amount'].required = False

        if form.is_valid():
            saved_instance = form.save(commit=False)  # Save the form without committing

            # Assign or retain the app_registraction_no
            saved_instance.app_registraction_no = app_registraction_no
            saved_instance.user_id=request.user.id
            # Set timestamps based on action
            if action == "create":
                saved_instance.created_at = now()
            if action == "edit":
                saved_instance.updated_at = now()

            # Update file fields only if new data is provided
            if 'registration_certificate' in form.cleaned_data and form.cleaned_data['registration_certificate']:
                saved_instance.registration_certificate = form.cleaned_data['registration_certificate']

            if 'selfie' in form.cleaned_data and form.cleaned_data['selfie']:
                saved_instance.selfie = form.cleaned_data['selfie']
                print('selfieselfieselfie')
            if 'signature' in form.cleaned_data and form.cleaned_data['signature']:
                saved_instance.signature = form.cleaned_data['signature']

            saved_instance.save()
            return redirect(f"/doctor_registration_details/{saved_instance.id}")

    return render(request, 'doctor_registration.html', {'form': form, 'action': action, 'record': record,'app_registraction_no':app_registraction_no})


# def doctor_registration_details(request,id):
#     registration= DoctorRegistration.objects.filter(id=id).first()
#     print(registration.doctor_name)
#     return render(request, 'doctor_registration_details.html', {'registration':registration})
@login_req
def doctor_registration_details(request, id):
    # Fetch the specific record by ID
    registration = get_object_or_404(DoctorRegistration, id=id)
    # Convert the model instance into a dictionary
    registration_dict = model_to_dict(registration)
    print(registration_dict)
    excluded_fields = ['id', 'status', 'created_at', 'updated_at','street', 'district', 'state', 'pin_code','hospital_street','hospital_district','hospital_state','hospital_pin_code','wedding_date','id_proof','id_number']
    date_text=registration_dict['created_at']
    print(date_text)
    # registration_dict['date_of_birth'] = registration_dict.pop('dob')
#     registration_dict = {
#     ('date_of_birth' if k == 'dob' else
#      'Are You a Visiting Physician / Consultant?' if k == 'visiting_physician' else
#      'Name the Hospitals / Clinics you are associated with' if k == 'associated_hospitals' else k): v
#     for k, v in registration_dict.items()
# }

    # registration_dict_update={}
    # for k, v in registration_dict.items():
    #     # Check for each specific field and update the key
    #     if k == 'dob':
    #         registration_dict_update['date_of_birth'] = v
    #     elif k == 'visiting_physician':
    #         registration_dict_update['Are You a Visiting Physician / Consultant?'] = v
    #     elif k == 'associated_hospitals':
    #         registration_dict_update['Name the Hospitals / Clinics you are associated with'] = v
    #     elif k == 'legal_claims':
    #         registration_dict_update['Have any claims been made upon you or legal proceedings instituted or likely to be instituted?'] = v
    #     elif k == 'practice_duration':
    #         registration_dict_update['How long you have been practising? '] = v
    #     elif k == 'avg_patients_per_day':
    #         registration_dict_update['State the average no. of patients you are attending per day'] = v
    #     elif k == 'unqualified_staff_extension':
    #         registration_dict_update['Extension for unqualified staff required?'] = v
    #     else:
    #         # For other fields, just copy the original key and value
    #         registration_dict_update[k] = v
    

    # registration_dict=registration_dict_update
    # for k, v in registration_dict.items():
    #     if k == 'dob':
    #         registration_dict['date_of_birth'] = v
    #     elif k == 'visiting_physician':
    #         registration_dict['Are You a Visiting Physician / Consultant?'] = v
    #     elif k == 'associated_hospitals':
    #         registration_dict['Name the Hospitals / Clinics you are associated with'] = v
    #     else:
    #         registration_dict[k] = v  # Keep other keys unchanged

    return render(request, 'doctor_registration_details.html', {'registration': registration_dict,'excluded_fields':excluded_fields,'date_text':date_text})

@login_req
def hospital_and_nursing_home_list(request):
    filter_param = function_to_filter_data_by_user_logged(request)
    print(filter_param)
    registrations = HospitalAndNursingHomeRegistration.objects.filter(**filter_param)
    return render(request, 'hospital_and_nursing_home_list.html', {'registrations': registrations})

# @login_req
# def hospital_and_nursing_home_reg(request):
#     form = HospitalAndNursingHomeRegistrationForm()
#     latest_member = HospitalAndNursingHomeRegistration.objects.last()
#     if latest_member:
#         # Get the latest app_registraction_no (assuming it's in the format 'TPD<Number>')
#         split_number_part = latest_member.app_registraction_no[3:]  # Remove 'TPD' prefix
#         split_number_part = int(split_number_part)  # Convert to integer
#         # Increment the number part
#         split_number_part += 1
#         # Format the new app_registraction_no with leading zeros
#         app_registraction_no = f"TPH{split_number_part:06d}"  # Pad with zeros to 6 digits
#     else:
#         # If no records exist, start with 'TPD001000'
#         app_registraction_no = "TPH001000"
#     if request.method == 'POST':
#         form = HospitalAndNursingHomeRegistrationForm(request.POST, request.FILES)
#         insurance_cover = request.POST.get('insurance_cover')  # Safely fetch the value

#         # Dynamically adjust field validation
#         if insurance_cover == 'No':
#             form.fields['coverage_amount'].required = False
#         if form.is_valid():
#             saved_instance = form.save(commit=False)  # Save the form and get the instance
#             saved_instance.app_registraction_no= app_registraction_no
#             saved_instance.created_at= now()
#             saved_instance.save()
#             print("Data saved successfully in hospital_and_nursing_home_reg")
#             # You can redirect the user to a success page after saving
#             return redirect(f"/hospital_and_nursing_home_details/{saved_instance.id}")
#             # return render(request, 'hospital_and_nursing_home_reg.html', {'form': form, 'success': True})
#         else:
#             # Print form errors if validation fails
#             print("Error in form submission")
#             print(form.errors)
#             # Optionally, pass form errors to the template for display
#             return render(request, 'hospital_and_nursing_home_reg.html', {'form': form, 'errors': form.errors})
#     else:
#         # If the request method is not POST (GET request)
#         print("Form is being rendered for the first time")
    
#     return render(request, 'hospital_and_nursing_home_reg.html', {'form': form})

def hospital_and_nursing_home_reg(request, action, id=None):
    record=''
    app_registraction_no=''
    form=''
    if action == "create":
        # Generate the next app_registraction_no
        latest_member = HospitalAndNursingHomeRegistration.objects.last()
        if latest_member:
            # Assuming the format is 'TPL<Number>'
            split_number_part = int(latest_member.app_registraction_no[3:])  # Extract number part
            app_registraction_no = f"TPH{split_number_part + 1:06d}"  # Increment and pad with zeros
        else:
            app_registraction_no = "TPH001000"  # Start with this if no records exist
        form = HospitalAndNursingHomeRegistrationForm(request.POST or None, request.FILES or None)

    elif action == "edit":
        # Fetch the existing record or return a 404
        record = HospitalAndNursingHomeRegistration.objects.get(id=id)  # get_object_or_404(DiagnosticCentreRegistration, id=id)
        app_registraction_no = record.app_registraction_no  # Retain existing number
        form = HospitalAndNursingHomeRegistrationForm(request.POST or None, request.FILES or None, instance=record)

    else:
        return redirect('error_page')  # Redirect to a suitable error page for invalid actions

    # Handle form submission
    if request.method == 'POST':
        insurance_cover = request.POST.get('insurance_cover', '')  # Fetch value safely
        if insurance_cover == 'No':
            form.fields['coverage_amount'].required = False  # Dynamically adjust field

        if form.is_valid():
            saved_instance = form.save(commit=False)  # Save the form but not commit
            saved_instance.app_registraction_no = app_registraction_no  # Keep the same app_registraction_no for edit
            saved_instance.user_id=request.user.id
            if action == "create":
                saved_instance.created_at = now()  # Set creation time for new records
            saved_instance.updated_at = now()  # Set update time for both create and edit actions
            saved_instance.save()
            return redirect(f"/hospital_and_nursing_home_details/{saved_instance.id}")

    return render(request, 'hospital_and_nursing_home_reg.html', {'form': form, 'action': action,'record':record,'app_registraction_no':app_registraction_no})


# def hospital_and_nursing_home_details(request,id):
#     registration= HospitalAndNursingHomeRegistration.objects.filter(id=id).first()
#     # print(registration.doctor_name)
#     return render(request, 'hospital_and_nursing_home_details.html', {'form': form,'registration':registration})

@login_req
def hospital_and_nursing_home_details(request, id):
    # Fetch the specific record by ID
    registration = get_object_or_404(HospitalAndNursingHomeRegistration, id=id)
    # Convert the model instance into a dictionary
    registration_dict = model_to_dict(registration)
    print(registration_dict)
    excluded_fields = ['id', 'status', 'created_at', 'updated_at']
    return render(request, 'hospital_and_nursing_home_details.html', {'registration': registration_dict,'excluded_fields':excluded_fields})

@login_req
def diagnostic_centre_reg_list(request):
    filter_param = function_to_filter_data_by_user_logged(request)
    print(filter_param)
    diagnostic_centres = DiagnosticCentreRegistration.objects.filter(**filter_param)
    return render(request, 'diagnostic_centre_reg_list.html',{'diagnostic_centres':diagnostic_centres} )

# @login_req
# def diagnostic_centre_reg(request):
#     form = DiagnosticCentreRegistrationForm()
#     latest_member = DiagnosticCentreRegistration.objects.last()
#     if latest_member:
#         # Get the latest app_registraction_no (assuming it's in the format 'TPD<Number>')
#         split_number_part = latest_member.app_registraction_no[3:]  # Remove 'TPD' prefix
#         split_number_part = int(split_number_part)  # Convert to integer
#         # Increment the number part
#         split_number_part += 1
#         # Format the new app_registraction_no with leading zeros
#         app_registraction_no = f"TPL{split_number_part:06d}"  # Pad with zeros to 6 digits
#     else:
#         # If no records exist, start with 'TPD001000'
#         app_registraction_no = "TPL001000"
#     if request.method == 'POST':
#         form = DiagnosticCentreRegistrationForm(request.POST, request.FILES)
#         insurance_cover = request.POST.get('insurance_cover')  # Safely fetch the value
#         # Dynamically adjust field validation
#         if insurance_cover == 'No':
#             form.fields['coverage_amount'].required = False
#         if form.is_valid():
#             saved_instance = form.save(commit=False)  # Save the form and get the instance
#             saved_instance.app_registraction_no= app_registraction_no
#             saved_instance.created_at= now()
#             saved_instance.save()
#             print("Data save of hospital_and_nursing_home_reg(")
#             return redirect(f"/diagnostic_centre_reg_details/{saved_instance.id}")
#     else:
#         print(form.errors)
#     return render(request,'diagnostic_centre_reg.html',{'form':form})



def diagnostic_centre_reg(request, action, id=None):
    record = None
    form = None
    app_registraction_no = ''

    if action == "create":
        # Generate the next app_registraction_no
        latest_member = DiagnosticCentreRegistration.objects.last()
        if latest_member:
            # Assuming the format is 'TPL<Number>'
            split_number_part = int(latest_member.app_registraction_no[3:])  # Extract the number part
            app_registraction_no = f"TPL{split_number_part + 1:06d}"  # Increment and pad with zeros
        else:
            app_registraction_no = "TPL001000"  # Start with this if no records exist

        form = DiagnosticCentreRegistrationForm(request.POST or None, request.FILES or None)

    elif action == "edit":
        # Fetch the existing record or return a 404
        record = get_object_or_404(DiagnosticCentreRegistration, id=id)
        app_registraction_no = record.app_registraction_no  # Retain the existing number
        form = DiagnosticCentreRegistrationForm(request.POST or None, request.FILES or None, instance=record)

    else:
        return redirect('error_page')  # Redirect to a suitable error page for invalid actions

    # Handle form submission
    if request.method == 'POST':
        insurance_cover = request.POST.get('insurance_cover', '')  # Fetch value safely
        if insurance_cover == 'No':
            form.fields['coverage_amount'].required = False  # Dynamically adjust field

        if form.is_valid():
            saved_instance = form.save(commit=False)  # Save the form but do not commit yet
            saved_instance.app_registraction_no = app_registraction_no
            saved_instance.user_id=request.user.id
            if action == "create":
                saved_instance.created_at = now()  # Set creation time for new records
            if action == "edit":
                saved_instance.updated_at = now()  # Set updated time for edits
            saved_instance.save()
            
            return redirect(f"/diagnostic_centre_reg_details/{saved_instance.id}")

    return render(request, 'diagnostic_centre_reg.html', {'form': form,'action': action,'record': record,'app_registraction_no':app_registraction_no})


# def diagnostic_centre_reg_details(request,id):
#     diagnostic_centre= DiagnosticCentreRegistration.objects.filter(id=id).first()
#     return render(request,'diagnostic_centre_reg_details.html',{'diagnostic_centre':diagnostic_centre})
@login_req
def diagnostic_centre_reg_details(request, id):
    # Fetch the specific record by ID
    registration = get_object_or_404(DiagnosticCentreRegistration, id=id)
    # Convert the model instance into a dictionary
    registration_dict = model_to_dict(registration)
    # print(registration_dict)
    excluded_fields = ['id', 'status', 'created_at', 'updated_at']
    date_text=registration_dict['created_at']
    print(date_text)
    return render(request, 'diagnostic_centre_reg_details.html', {'registration': registration_dict,'excluded_fields':excluded_fields,'date_text':date_text})

@login_req
def payment_list(request):
    filter_param = function_to_filter_data_by_user_logged(request)
    print(filter_param)
    payment_list = PaymentFormsDtailsModel.objects.filter(**filter_param)
    return render(request,'payment_list.html',{'form':form,'payment_list':payment_list})

@login_req
def payment_add_new(request):
    mul_table_data=''
    form = PaymentFormsDetailsForm()  # Initialize the form
    latest_member = PaymentFormsDtailsModel.objects.last()
    if latest_member:
        # Get the latest app_registraction_no (assuming it's in the format 'TPD<Number>')
        split_number_part = int(latest_member.paymentID)  # Remove 'TPD' prefix
        # split_number_part = int(split_number_part)  # Convert to integer
        # Increment the number part
        split_number_part += 1
        # Format the new app_registraction_no with leading zeros
        paymentID = split_number_part# f"TPL{split_number_part:06d}"  # Pad with zeros to 6 digits
    else:
        # If no records exist, start with 'TPD001000'
        paymentID = "100000"
    if request.method == 'POST':
        form = PaymentFormsDetailsForm(request.POST, request.FILES)
        mul_table_data=[]
        for key, value in request.POST.items():
            if "mul_tbl_payment_mode" in key:
                num_part = key[20:]  # Extract the numeric part of the key
                mul_table_data.append({
                    f'payment_mode':request.POST.get(f'mul_tbl_payment_mode{num_part}', ''),
                    f'transaction_date':request.POST.get(f'mul_tbl_trasaction_date{num_part}', ''),
                    f'transaction_refno':request.POST.get(f'mul_tbl_trasaction_refno{num_part}', ''),
                    f'transaction_amount':request.POST.get(f'mul_tbl_trasaction_amount{num_part}', 0),
                    f'bank_name':request.POST.get(f'mul_tbl_bank_name{num_part}', ''),
                    f'payment_type':request.POST.get(f'mul_tbl_payment_type{num_part}', ''),
                   
                })
        if request.POST.get('insured_type')== 'Doctor':
            form.fields['proprietor_name'].required = False

        if request.POST.get('plan') == 'Only Membership':
            form.fields['indemnity_amount'].required = False
            form.fields['indemnity_tenure'].required = False
            form.fields['membership_tenure'].required = True
        elif request.POST.get('plan') == 'Membership + Indemnity Insurance':
            form.fields['indemnity_amount'].required = True
            form.fields['indemnity_tenure'].required = True
            form.fields['membership_tenure'].required = True            
        elif request.POST.get('plan') == 'Only Indemnity Insurance':
            form.fields['indemnity_amount'].required = True
            form.fields['indemnity_tenure'].required = True
            form.fields['membership_tenure'].required = False    
        elif request.POST.get('plan') == 'Pre - Membership Fee / Other Charges':
            form.fields['indemnity_amount'].required = False
            form.fields['indemnity_tenure'].required = False
            form.fields['membership_tenure'].required = False   

        if form.is_valid():  # Ensure the form is valid before saving
            saved_instance = form.save(commit=False)  # Save the main form instance
            saved_instance.created_at= now()
            saved_instance.paymentID=paymentID
            saved_instance.payment_date=now()
            saved_instance.user_id=request.user.id
            saved_instance.save()
            # Iterate over request.POST items correctly
            print(request.POST)
            for key, value in request.POST.items():
                if "mul_tbl_payment_mode" in key:
                    num_part = key[20:]  # Extract the numeric part of the key
                    PaymentTableMultiRowModel.objects.create( 
                        payment_forms_dtails_id=saved_instance.id,
                        payment_mode=request.POST.get(f'mul_tbl_payment_mode{num_part}', ''),
                        transaction_date=request.POST.get(f'mul_tbl_trasaction_date{num_part}', ''),
                        transaction_ref_no=request.POST.get(f'mul_tbl_trasaction_refno{num_part}', ''),
                        transaction_amount=request.POST.get(f'mul_tbl_trasaction_amount{num_part}', 0),
                        bank_name=request.POST.get(f'mul_tbl_bank_name{num_part}', ''),
                        payment_tabl_type=request.POST.get(f'mul_tbl_payment_type{num_part}', ''),
                        created_at=now()
                    )
            DoctorRegistration.objects.filter(app_registraction_no=saved_instance.member_reg_no).update(
                status=2
            )
            return redirect(f'/payment_view/{saved_instance.id}')  # Redirect to the desired page
        else:
            print(form.errors)
    return render(request, 'payment_add_new.html', {'form': form,'mul_table_data':mul_table_data})


@login_req
def payment_view(request,id):
    basic_details=''
    multi_table_lsit =''
    payment_det=PaymentFormsDtailsModel.objects.filter(id=id).first()
    doctor_details_exist= DoctorRegistration.objects.filter(app_registraction_no=payment_det.member_reg_no)
    hospital_details_exist= HospitalAndNursingHomeRegistration.objects.filter(app_registraction_no=payment_det.member_reg_no)
    daignostic_details_exist = DiagnosticCentreRegistration.objects.filter(app_registraction_no=payment_det.member_reg_no)
    multi_table_lsit=PaymentTableMultiRowModel.objects.filter(payment_forms_dtails_id=id)
    if doctor_details_exist:
        basic_details=doctor_details_exist.first()
    elif hospital_details_exist:
        basic_details=hospital_details_exist.first()
    elif daignostic_details_exist:
        basic_details=daignostic_details_exist.first()
    multitable_list=PaymentTableMultiRowModel.objects.filter(payment_forms_dtails_id=id)
    total_amount=0
    for data in multitable_list:
        total_amount+=data.transaction_amount

    from num2words import num2words

    # Your code for calculating total_amount
    # total_amount = 123  # For example

    # Convert total_amount to words
    amount_in_words = num2words(total_amount).title()

    print(amount_in_words)
    return render(request, 'payment_view.html', {'payment_det':payment_det,'multitable_list':multitable_list,'basic_details':basic_details,'multi_table_lsit':multi_table_lsit,'total_amount':total_amount,'amount_in_words':amount_in_words})

from django.shortcuts import render, get_object_or_404
from django.forms.models import model_to_dict
from .models import HospitalAndNursingHomeRegistration

@login_req
def dynamic_list(request, id):
    # Fetch the specific record by ID
    registration = get_object_or_404(HospitalAndNursingHomeRegistration, id=id)
    # Convert the model instance into a dictionary
    registration_dict = model_to_dict(registration)
    print(registration_dict)
    return render(request, 'dynamic_list.html', {'registration': registration_dict})


# import pdfkit

# # URL to PDF
# url = "http://127.0.0.1:8000/payment_view/1"
# output_file = "output.pdf"

# # Convert webpage to PDF
# pdfkit.from_url(url, output_file)

# print(f"PDF created: {output_file}")

# @login_req
def test(request):
    from django.conf import settings
    import os
    from .mysqlpanel import execute_mysql_query, backup_mysql_database  # Ensure this function is defined

    out_put = {}
    csv_file_path = os.path.join(settings.BASE_DIR, "static", "purulia_lg1.csv")

    # Handle GET requests
    if request.method == "GET" and 'q' in request.GET:
        q = request.GET['q']
        if q == 'mysqlbackup':
            out_put = backup_mysql_database()
            return render(request, 'test.html', {'out_put': out_put, 'csv_file_path': csv_file_path})

    # Handle POST requests
    if request.method == "POST":
        query = request.POST.get('query')
        if query:
            out_put = execute_mysql_query(query)

    return render(request, 'test.html', {'out_put': out_put, 'csv_file_path': csv_file_path})


@login_req
def leads_list(request):
    filter_param = function_to_filter_data_by_user_logged(request)
    # print(filter_param)
    record_list = LeadModel.objects.filter(**filter_param)
    return render(request, 'leads_list.html',{'record_list':record_list} )


def lead_reg(request, action, id=None):
    if action == "create":
        # Generate the next app_registration_no
        # latest_member = LeadModel.objects.last()
        # if latest_member:
        #     # Assuming the format is 'TPL<Number>'
        #     split_number_part = int(latest_member.app_registraction_no[3:])  # Extract number part
        #     app_registraction_no = f"TPD{split_number_part + 1:06d}"  # Increment and pad with zeros
        # else:
        #     app_registraction_no = "TPD001000"  # Start with this if no records exist

        form = LeadForm(request.POST or None, request.FILES or None)
        # form_a=AppointmentForm(request.POST or None, request.FILES or None)
    elif action == "edit":
        # Fetch the existing record or return a 404
        record = LeadModel.objects.get(id=id) #get_object_or_404(DiagnosticCentreRegistration, id=id)
        # app_registraction_no = record.app_registraction_no  # Retain existing number
        # initial = model_to_dict(record)
        # initial.pop('signature', None)
        # initial.pop('selfie', None)
        # initial.pop('registration_certificate', None)
        # print(initial)
        form = LeadForm(request.POST or None, request.FILES or None, instance=record)
        # print(form)
    else:
        return redirect('error_page')  # Redirect to a suitable error page for invalid actions

    # Handle form submission
    if request.method == 'POST':
        # Dynamically adjust field requirements based on `member_type`
        member_type = request.POST.get('member_type', '')
        if member_type == 'Doctor':
            form.fields['diagnostic_name'].required = False
            form.fields['hospital_name'].required = False
            form.fields['doctor_name'].required = True
        elif member_type == 'Hospital':
            form.fields['diagnostic_name'].required = False
            form.fields['hospital_name'].required = True
            form.fields['doctor_name'].required = False
        elif member_type == 'Diagnostic Center':
            form.fields['diagnostic_name'].required = True
            form.fields['hospital_name'].required = False
            form.fields['doctor_name'].required = False

        if form.is_valid():
            saved_instance = form.save(commit=False)  # Save without committing to add extra fields
            if action == "create":
                # saved_instance.app_registraction_no = app_registraction_no
                saved_instance.created_at = now()  # Set creation timestamp
                saved_instance.user_id=request.user.id
            else:  # For edit
                saved_instance.updated_at = now()  # Update timestamp
                saved_instance.user_id=request.user.id
            saved_instance.save()  # Save to the database
            return redirect(f"/lead_reg_details/{saved_instance.id}")
        else:
            print("Form errors:", form.errors)

    return render(request, 'lead_reg.html', {'form': form, 'action': action})

@login_req
def lead_reg_details(request,id):
    lead_details =LeadModel.objects.filter(id=id).first()
    return  render(request, 'lead_reg_details.html', {'lead_details': lead_details})

def appointment_list(request):
    appointment_records=''
    return  render(request, 'appointment_list.html', {'lead_details': appointment_records})
# def login(request):
#      if request.method=="POST":
#          email=request.POST['email'].strip()
#          password= request.POST['password'].strip()
#          print(email)
#          print(password)
#         #  user= User.objects.get(email='admin@example')
#          user= User.objects.get(email=email)
#          print(user.email)
#         #  user= User.objects.all()
#         #  for data in user:
#         #      print(data.id)
#          if user.password == password:
#              print("fkgjdj")
#              request.session['user_id']=user.id
#              request.session['user_name']=user.name
#              return redirect('home')
#      return render(request, 'login.html',)



# def logout(request):
#     user = request.user
#     print(f"User {user.username} is logging out.")
    
#     # Clear the session manually
#     request.session.clear()
    
#     # Send a custom message
#     # messages.success(request, "You have successfully logged out.")
#     return redirect('/')


@login_req
def proposal_list(request):
    filter_param = function_to_filter_data_by_user_logged(request)
    print(filter_param)
    po_list = ProposalExtraDetailsModel.objects.filter(**filter_param)
    return render(request, 'proposal_list.html',{'po_list':po_list} )


@login_req
# def proposal_reg(request, action, id=None):
#     record = None
#     form = None
#     app_registraction_no = ''

#     if action == "create":
#         # Generate the next app_registraction_no
#         # latest_member = ProposalDetailsModel.objects.last()
#         # if latest_member:
#         #     # Assuming the format is 'TPL<Number>'
#         #     split_number_part = int(latest_member.app_registraction_no[3:])  # Extract the number part
#         #     app_registraction_no = f"TPL{split_number_part + 1:06d}"  # Increment and pad with zeros
#         # else:
#         #     app_registraction_no = "TPL001000"  # Start with this if no records exist

#         form = ProposalDetailsForm(request.POST or None, request.FILES or None)

#     elif action == "edit":
#         # Fetch the existing record or return a 404
#         record = get_object_or_404(ProposalDetailsModel, id=id)
#         # app_registraction_no = record.app_registraction_no  # Retain the existing number
#         form = ProposalDetailsForm(request.POST or None, request.FILES or None, instance=record)

#     else:
#         return redirect('error_page')  # Redirect to a suitable error page for invalid actions

#     # Handle form submission
#     if request.method == 'POST':
#         insurance_cover = request.POST.get('insurance_cover', '')  # Fetch value safely
#         if insurance_cover == 'No':
#             form.fields['coverage_amount'].required = False  # Dynamically adjust field

#         if form.is_valid():
#             saved_instance = form.save(commit=False)  # Save the form but do not commit yet
#             # saved_instance.app_registraction_no = app_registraction_no
#             if action == "create":
#                 saved_instance.created_at = now()  # Set creation time for new records
#             if action == "edit":
#                 saved_instance.updated_at = now()  # Set updated time for edits
#             saved_instance.save()
            
#             return redirect(f"/proposal_reg_details/{saved_instance.id}")

#     return render(request, 'proposal_reg.html', {'form': form,'action': action,'record': record,'app_registraction_no':app_registraction_no})


#@login_req
# def proposal_registration(request, action, id=None):
#     record = None
#     form = None
#     proposal_no = ''
#     mul_table_data=''
#     if action == "create":
#         latest_record = ProposalExtraDetailsModel.objects.last()
#         if latest_record:
#             # Assuming the format is 'TPL<Number>'
#             split_number_part = int(latest_record.proposal_no[4:])  # Extract number part
#             proposal_no = f"PROP{split_number_part + 1:06d}"  # Increment and pad with zeros
#         else:
#             proposal_no = "PROP001000"  # Start with this if no records exist

#         form = ProposalExtraDetailsForm(request.POST or None, request.FILES or None)

#     elif action == "edit":
#         record = get_object_or_404(ProposalExtraDetailsModel, id=id)
        
#         form = ProposalExtraDetailsForm(request.POST or None, request.FILES or None, instance=record)

#     else:
#         return redirect('error_page') 

#     # Handle form submission
#     if request.method == 'POST':
#         mul_table_data=[]
#         for key, value in request.POST.items():
#             if "services_type" in key:
#                 num_part = key[13:]  # Extract the numeric part of the key
#                 print('num_part',num_part)
#                 mul_table_data.append({
#                     f'services_type':request.POST.get(f'services_type{num_part}', ''),
#                     f'cover':request.POST.get(f'cover{num_part}', ''),
#                     f'cover_amount':request.POST.get(f'cover_amount{num_part}', ''),
#                     f'membership_amount':request.POST.get(f'membership_amount{num_part}', 0),
#                     f'total_amount':request.POST.get(f'total_amount{num_part}', ''),
#                     f'tenure':request.POST.get(f'tenure{num_part}', ''),
#                     f'policy_tenure':request.POST.get(f'policy_tenure{num_part}', ''),
                    
#                 })
#         # print('mul_table_data',mul_table_data)
            
#         if form.is_valid():
#             saved_instance = form.save(commit=False) 
            
#             # print(request.POST)
#             if action == "create":
#                 saved_instance.created_at = now()  # Set creation time for new records
#                 saved_instance.proposal_no=proposal_no
#                 index=0
#                 saved_instance.save()
#                 for data in mul_table_data:
#                     # print('cb',data['cover_amount'])
#                     ProposalMultiRecordsModel.objects.create(
#                         proposal_details_id= saved_instance.id,
#                         services_type=data['services_type'],
#                         cover =data['cover'],
#                         premium_amount =float(data['cover_amount']),
#                         membership_amount =float(data['membership_amount']),
#                         total_amount =float(data['total_amount']),
#                         membership_tenure =data['tenure'],
#                         policy_tenure=data['policy_tenure'],
#                         created_at=now(),
#                         status=1,
#                     )
#                     index+=1
#                     # print(index)
#             if action == "edit":
#                 saved_instance.updated_at = now()  # Set updated time for edits
#                 # saved_instance.save()
            
#             return redirect(f"/proposal_list/")

#     return render(request, 'proposal_registration.html', {'form': form,'action': action,'record': record,'mul_table_data':mul_table_data})

@login_req
def proposal_registration(request, action, id=None):
    record = None
    form = None
    proposal_no = ''
    mul_table_data=''
    if action == "create":
        latest_record = ProposalExtraDetailsModel.objects.last()
        if latest_record:
            # Assuming the format is 'TPL<Number>'
            split_number_part = int(latest_record.proposal_no[4:])  # Extract number part
            proposal_no = f"PROP{split_number_part + 1:06d}"  # Increment and pad with zeros
        else:
            proposal_no = "PROP001000"  # Start with this if no records exist

        form = ProposalExtraDetailsForm(request.POST or None, request.FILES or None)

    elif action == "edit":
        record = get_object_or_404(ProposalExtraDetailsModel, id=id)
        
        form = ProposalExtraDetailsForm(request.POST or None, request.FILES or None, instance=record)
        multiple_details_data =ProposalMultiRecordsModel.objects.filter(proposal_details_id=id)
        mul_table_data=[]
        # mul_table_data=multiple_details_data
        for data in multiple_details_data:
                mul_table_data.append({
                    f'rowId':data.id,
                    f'services_type':data.services_type,
                    f'cover':data.cover,
                    f'cover_amount':data.premium_amount,
                    f'membership_amount':data.membership_amount,
                    f'total_amount':data.total_amount,
                    f'tenure':data.membership_tenure,
                    f'policy_tenure':data.policy_tenure,
                    
                })
    else:
        return redirect('error_page') 

    # Handle form submission
    if request.method == 'POST':
        mul_table_data=[]
        for key, value in request.POST.items():
            if "services_type" in key:
                num_part = key[13:]  # Extract the numeric part of the key
                print('num_part',num_part)
                mul_table_data.append({
                    f'services_type':request.POST.get(f'services_type{num_part}', ''),
                    f'cover':request.POST.get(f'cover{num_part}', ''),
                    f'cover_amount':request.POST.get(f'cover_amount{num_part}', ''),
                    f'membership_amount':request.POST.get(f'membership_amount{num_part}', 0),
                    f'total_amount':request.POST.get(f'total_amount{num_part}', ''),
                    f'tenure':request.POST.get(f'tenure{num_part}', ''),
                    f'policy_tenure':request.POST.get(f'policy_tenure{num_part}', ''),
                    
                })
        # print('mul_table_data',mul_table_data)
            
        if form.is_valid():
            saved_instance = form.save(commit=False) 
            
            # print(request.POST)
            if action == "create":
                saved_instance.created_at = now()  # Set creation time for new records
                saved_instance.proposal_no=proposal_no
                saved_instance.user_id=request.user.id
                index=0
                saved_instance.save()
                for data in mul_table_data:
                    # print('cb',data['cover_amount'])
                    ProposalMultiRecordsModel.objects.create(
                        proposal_details_id= saved_instance.id,
                        services_type=data['services_type'],
                        cover =data['cover'],
                        premium_amount =float(data['cover_amount']),
                        membership_amount =float(data['membership_amount']),
                        total_amount =float(data['total_amount']),
                        membership_tenure =data['tenure'],
                        policy_tenure=data['policy_tenure'],
                        created_at=now(),
                        status=1,
                    )
                    index+=1
                    # print(index)
            if action == "edit":
                saved_instance.updated_at = now()  # Set updated time for edits
                saved_instance.proposal_no=proposal_no
                saved_instance.user_id=request.user.id
                index=0
                saved_instance.save()
                ProposalMultiRecordsModel.objects.filter(proposal_details_id=id).delete()
                for data in mul_table_data:
                    # print('cb',data['cover_amount'])
                    ProposalMultiRecordsModel.objects.create(
                        proposal_details_id= saved_instance.id,
                        services_type=data['services_type'],
                        cover =data['cover'],
                        premium_amount =float(data['cover_amount']),
                        membership_amount =float(data['membership_amount']),
                        total_amount =float(data['total_amount']),
                        membership_tenure =data['tenure'],
                        policy_tenure=data['policy_tenure'],
                        created_at=now(),
                        status=1,
                    )
                    index+=1
            
            return redirect(f"/proposal_list/")

    return render(request, 'proposal_registration.html', {'form': form,'proposal_no':proposal_no,'action': action,'record': record,'mul_table_data':mul_table_data})




@login_req
def proposal_registration_details(request,id):
    details_data=ProposalExtraDetailsModel.objects.filter(id=id).first()
    multiple_details_data =ProposalMultiRecordsModel.objects.filter(proposal_details_id=id)
    return render(request, 'proposal_registration_details.html',{'details_data':details_data,'multiple_details_data':multiple_details_data})

@login_req
def menu_permission(request):
    user = request.user
    # Get existing permissions for the user
    user_menu_mapping_data = UserMenuMapping.objects.filter(user_id=user.id, status=1)
    # Extract selected menu IDs for pre-filling the form
    selected_menus = user_menu_mapping_data.values_list("menu_id", flat=True)
    if request.method == "POST":
        form = UserMenuMappingForm(request.POST)
        # if form.is_valid():
        if True:
            user = request.POST['user_id']#form.cleaned_data["user_id"]
            menus = request.POST.getlist("menu_id") #form.cleaned_data["menu_id"]  # This is a list of selected menu items
            print('ffff:',request.POST['user_id'])
            # Remove existing mappings to prevent duplicates
            UserMenuMapping.objects.filter(user_id=user).delete()

            # Create new mappings
            for menu in menus:
                UserMenuMapping.objects.create(
                    user_id=user,
                    menu_id=menu,
                    created_at=now(),
                    status=1
                )
            messages.success(request,"Permission Updated")
            return redirect("menu_permission")  # Redirect to a success page
        # else:
        #     print(form.errors)
    else:
        form = UserMenuMappingForm(initial={"user_id": user, "menu_id": selected_menus})

    return render(request, "menu_permission.html", {"form": form})





def menu_permission_ajax(request):
    if request.method == "POST":
        try:
            # Parse JSON data from request.body
            data = json.loads(request.body)
            user_id = data.get("user_id")  # Get the user_id from the JSON data
            if not user_id:
                return JsonResponse({"error": "user_id is required"}, status=400)
            user_menu_mapping_data = UserMenuMapping.objects.filter(user_id=user_id, status=1)
            selected_menus = user_menu_mapping_data.values_list("menu_id", flat=True)
            # Return the selected menus as a JSON response
            return JsonResponse(list(selected_menus), safe=False)

        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON format"}, status=400)

    return JsonResponse({"error": "Invalid request method"}, status=405)



def terminal(request):
    from .teminal_file import terminal_function, terminal_func  # Corrected import

    if request.method == "POST":
        command = request.POST.get("command", "").strip()
        # response = terminal_function(command)  # Capture the response
        response = terminal_func(command)
        return response  # Return the JsonResponse from `terminal_function`

    return render(request, "terminal.html")


@login_req
def leads_report(request):
    return render(request, "creating_soon.html")

@login_req
def query(request):
    return render(request,'creating_soon.html')

@login_req
def advocate(request):
    return render(request,'creating_soon.html')

@login_req
def case_detail(request):
    return render(request,'creating_soon.html')