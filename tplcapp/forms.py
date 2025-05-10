from django import forms

from .models import *

from django.contrib.auth.forms import UserCreationForm, AuthenticationForm



from django.forms.widgets import ClearableFileInput



class CustomFileInput(ClearableFileInput):

    template_name = 'custom_widgets/file_input.html'  # Use a custom template

    initial_text = ''  # Remove the "Currently" text

    clear_checkbox_label = ''  # Remove the "Clear" label



class CustomUserCreationForm(UserCreationForm):

    class Meta:

        model = CustomUser

        fields = ('email', 'name', 'password1', 'password2','address','area')#'is_active')

        # widgets = {

        #     'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter your email'}),

        #     'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your name'}),

        #     'password1': forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Enter your password'}),

        #     'password2': forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Confirm your password'}),

        # }



    def __init__(self, *args, **kwargs):

        super(CustomUserCreationForm, self).__init__(*args, **kwargs)

        self.fields['email'].widget = forms.EmailInput(attrs={'class': 'form-control', })

        self.fields['name'].widget = forms.TextInput(attrs={'class': 'form-control', })

        self.fields['address'].widget = forms.TextInput(attrs={'class': 'form-control', })

        self.fields['area'].widget = forms.TextInput(attrs={'class': 'form-control', })

        self.fields['password1'].widget = forms.PasswordInput(attrs={'class': 'form-control',})

        self.fields['password2'].widget = forms.PasswordInput(attrs={'class': 'form-control', })

        # self.fields['is_active'].widget= forms.CheckboxInput(attrs={'class': 'form-check-input'}),



class CustomAuthenticationForm(AuthenticationForm):

    class Meta:

        model = CustomUser

    def __init__(self, *args, **kwargs):

        super(CustomAuthenticationForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget = forms.EmailInput(attrs={'class': 'form-control', })

        self.fields['password'].widget = forms.PasswordInput(attrs={'class': 'form-control', })







class DoctorRegistrationForm(forms.ModelForm):

    class Meta:

        model = DoctorRegistration

        # fields = '__all__'

        exclude = ['app_registraction_no','created_at', 'updated_at','status','user_id'] 

        widgets = {

            'doctor_name': forms.TextInput(attrs={'class': 'form-control'}),

            'house_no': forms.TextInput(attrs={'class': 'form-control'}),

            'street': forms.TextInput(attrs={'class': 'form-control'}),

            'district': forms.TextInput(attrs={'class': 'form-control'}),

            'state': forms.TextInput(attrs={'class': 'form-control'}),

            'pin_code': forms.NumberInput(attrs={'class': 'form-control'}),

            'hospital_house_no': forms.TextInput(attrs={'class': 'form-control'}),

            'hospital_street': forms.TextInput(attrs={'class': 'form-control'}),

            'hospital_district': forms.TextInput(attrs={'class': 'form-control'}),

            'hospital_state': forms.TextInput(attrs={'class': 'form-control'}),

            'hospital_pin_code': forms.NumberInput(attrs={'class': 'form-control'}),

            'mobile_number': forms.TextInput(attrs={'class': 'form-control'}),

            'alternate_mobile_number': forms.TextInput(attrs={'class': 'form-control'}),

            'email': forms.EmailInput(attrs={'class': 'form-control'}),

            'dob': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),

            'wedding_date': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),

            'id_proof': forms.Select(attrs={'class': 'form-control'},choices=[

                                                ('', 'Please Select'),

                                                ('Aadhar', 'Aadhar'),

                                                ('PAN', 'PAN'),

                                                ('Driving License', 'Driving License'),

                                                ('Passport', 'Passport'),

                                                ('GST Certificate (For Non-Individual)', 'GST Certificate (For Non-Individual)'),

                                                ('Incorporation Certificate (For Non Individuals)', 'Incorporation Certificate (For Non Individuals)')

                                            ]),

            'id_number': forms.TextInput(attrs={'class': 'form-control'}),

            'speciality': forms.Select(attrs={'class': 'form-control'},choices= [

                        ("", "Please Select"),

                        ("ACCUPUNCTURIST", "ACCUPUNCTURIST"),

                        ("ANAESTHETIST", "ANAESTHETIST"),

                        ("BARIATRIC SURGEON", "BARIATRIC SURGEON"),

                        ("CANCER PHYSICIAN", "CANCER PHYSICIAN"),

                        ("CANCER SURGEON", "CANCER SURGEON"),

                        ("CARDIO THORACIC SURGEON", "CARDIO THORACIC SURGEON"),

                        ("CARDIOLOGIST", "CARDIOLOGIST"),

                        ("CARDIO-VASCULAR SURGEON", "CARDIO-VASCULAR SURGEON"),

                        ("CHEST & TURBERCULOSIS SPECIALIST", "CHEST & TURBERCULOSIS SPECIALIST"),

                        ("CHILD SPECIALIST", "CHILD SPECIALIST"),

                        ("CONSULTANT PHYSICIAN", "CONSULTANT PHYSICIAN"),

                        ("COSMETIC & PLASTIC SURGEON", "COSMETIC & PLASTIC SURGEON"),

                        ("COSMETIC SURGEON", "COSMETIC SURGEON"),

                        ("COSMETIC SURGEON AND DERMATOLOGIST", "COSMETIC SURGEON AND DERMATOLOGIST"),

                        ("COSMETIC AND HAIR TRANSPLANT SURGEON", "COSMETIC AND HAIR TRANSPLANT SURGEON"),

                        ("CRITICAL CARE SPECIALIST", "CRITICAL CARE SPECIALIST"),

                        ("DENTAL SURGEON / DENTIST", "DENTAL SURGEON / DENTIST"),

                        ("DERMATOLOGIST", "DERMATOLOGIST"),

                        ("DIABETOLOGIST", "DIABETOLOGIST"),

                        ("E.N.T. PHYSICIAN", "E.N.T. PHYSICIAN"),

                        ("E.N.T. SURGEON", "E.N.T. SURGEON"),

                        ("ENDOCRINOLOGIST", "ENDOCRINOLOGIST"),

                        ("EYE SURGEON", "EYE SURGEON"),

                        ("GASTRO ENTEROLOGY SURGEON", "GASTRO ENTEROLOGY SURGEON"),

                        ("GASTROENTEROLOGIST", "GASTROENTEROLOGIST"),

                        ("GENERAL PHYSICIAN (MBBS , BAMS , BUMS , BHMS)", "GENERAL PHYSICIAN (MBBS , BAMS , BUMS , BHMS)"),

                        ("GENERAL SURGEON", "GENERAL SURGEON"),

                        ("HAEMATOLOGIST", "HAEMATOLOGIST"),

                        ("HAIR TRANSPLANT SURGEON", "HAIR TRANSPLANT SURGEON"),

                        ("INTERVENTIONAL CARDIOLOGIST", "INTERVENTIONAL CARDIOLOGIST"),

                        ("MICROBIOLOGIST", "MICROBIOLOGIST"),

                        ("NEONATOLOGIST", "NEONATOLOGIST"),

                        ("NEPHROLOGIST", "NEPHROLOGIST"),

                        ("NEPHROSURGEON", "NEPHROSURGEON"),

                        ("NEUROLOGIST", "NEUROLOGIST"),

                        ("NEUROSURGEON", "NEUROSURGEON"),

                        ("OBSTETRICS & GYNAECOLOGIST", "OBSTETRICS & GYNAECOLOGIST"),

                        ("OCCUPATIONAL THERAPIST", "OCCUPATIONAL THERAPIST"),

                        ("ONCO SURGEON", "ONCO SURGEON"),

                        ("ONCOLOGIST", "ONCOLOGIST"),

                        ("OPHTHALMOLOGIST", "OPHTHALMOLOGIST"),

                        ("ORAL & MAXILLOFACIAL SURGEON", "ORAL & MAXILLOFACIAL SURGEON"),

                        ("ORTHOPAEDIC SURGEON", "ORTHOPAEDIC SURGEON"),

                        ("PAEDIATRIC SURGEON", "PAEDIATRIC SURGEON"),

                        ("PAEDIATRICIAN", "PAEDIATRICIAN"),

                        ("PATHOLOGIST", "PATHOLOGIST"),

                        ("PHYSIOTHERAPIST", "PHYSIOTHERAPIST"),

                        ("PLASTIC SURGEON", "PLASTIC SURGEON"),

                        ("PROCTOLOGIST", "PROCTOLOGIST"),

                        ("PSYCHIATRIST", "PSYCHIATRIST"),

                        ("PULMONOLOGIST", "PULMONOLOGIST"),

                        ("RADIOLOGIST", "RADIOLOGIST"),

                        ("RHEUMATOLOGIST", "RHEUMATOLOGIST"),

                        ("SKIN SPECIALIST", "SKIN SPECIALIST"),

                        ("THORACIC SURGEON", "THORACIC SURGEON"),

                        ("ULTRASONOLOGIST", "ULTRASONOLOGIST"),

                        ("UROLOGIST", "UROLOGIST"),

                        ("UROSURGEON", "UROSURGEON"),

                        ("VENEROLOGIST", "VENEROLOGIST"),

                        ("Other Speciality", "Other Speciality"),

                    ]),

            'other_speciality': forms.TextInput(attrs={'class': 'form-control'}),

            'qualification': forms.TextInput(attrs={'class': 'form-control'}),

            'registration_number': forms.TextInput(attrs={'class': 'form-control'}),

            'registration_year': forms.NumberInput(attrs={'class': 'form-control'}),

            'medical_council': forms.TextInput(attrs={'class': 'form-control'}),

            'visiting_physician': forms.Select(attrs={'class': 'form-control'},choices=[

                                                ('', 'Please Select'),

                                                ('Yes', 'Yes'),

                                                ('No', 'No'),

                                            ]),

            'associated_hospitals': forms.TextInput(attrs={'class': 'form-control'}),

            'legal_claims':  forms.TextInput(attrs={'class': 'form-control'}),

            'practice_duration': forms.NumberInput(attrs={'class': 'form-control'}),

            'avg_patients_per_day': forms.TextInput(attrs={'class': 'form-control'}),

            'unqualified_staff_extension': forms.Select(attrs={'class': 'form-control'},choices=[

                                                ('', 'Please Select'),

                                                ('Yes', 'Yes'),

                                                ('No', 'No'),

                                            ]),

            'annual_income': forms.NumberInput(attrs={'class': 'form-control'}),

            'insurance_cover': forms.Select(attrs={'class': 'form-control'},choices=[

                                                ('', 'Please Select'),

                                                ('Yes', 'Yes'),

                                                ('No', 'No'),

                                            ]),

            'coverage_amount': forms.Select(attrs={'class': 'form-control',},

                                choices=[

                                    ('', 'Please Select'),

                                    ('10 Lakh', '10 Lakh'),

                                    ('20 Lakh', '20 Lakh'),

                                    ('30 Lakh', '30 Lakh'),

                                    ('40 Lakh', '40 Lakh'),

                                    ('50 Lakh', '50 Lakh'),

                                    ('1 Crore', '1 Crore'),

                                    ('1.5 Crore', '1.5 Crore'),

                                    ('2 Crore', '2 Crore'),

                                    ('2.5 Crore', '2.5 Crore'),

                                    ('5 Crore', '5 Crore'),

                                ]

                                ),   

            # 'ref_doctor_1_name': forms.TextInput(attrs={'class': 'form-control'}),

            # 'ref_doctor_1_contact': forms.TextInput(attrs={'class': 'form-control'}),

            # 'ref_doctor_1_location': forms.TextInput(attrs={'class': 'form-control'}),

            # 'ref_doctor_2_name': forms.TextInput(attrs={'class': 'form-control'}),

            # 'ref_doctor_2_contact': forms.TextInput(attrs={'class': 'form-control'}),

            # 'ref_doctor_2_location': forms.TextInput(attrs={'class': 'form-control'}),

            'tenure_of_membership':forms.TextInput(attrs={'class': 'form-control'}),

            'tenure_of_indemnity':forms.TextInput(attrs={'class': 'form-control'}),

            'tplc_rep_name': forms.TextInput(attrs={'class': 'form-control'}),

            'tplc_rep_email': forms.EmailInput(attrs={'class': 'form-control'}),

            'total_amount_paid': forms.NumberInput(attrs={'class': 'form-control'}),

            'payment_details': forms.TextInput(attrs={'class': 'form-control'}),

            'registration_certificate': forms.ClearableFileInput(attrs={'class': 'form-control'}),

            'selfie': forms.ClearableFileInput(attrs={'class': 'form-control'}),

            'signature': forms.ClearableFileInput(attrs={'class': 'form-control'}),

            'submission_date_time': forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'datetime-local'}),

            'place_of_submission': forms.TextInput(attrs={'class': 'form-control'}),

        }



        labels = {

            'doctor_name': 'Name of Doctor ',

            'house_no': 'House No./ Flat No. / Block',

            'street': 'Street / Road / Locality',

            'district': 'District',

            'state': 'State',

            'pin_code': 'Pin Code',

            'hospital_house_no': ' Hospital House No./ Flat No. / Block',

            'hospital_street': 'Hospital Street / Road / Locality',

            'hospital_district': ' Hospital District',

            'hospital_state': ' Hospital State',

            'hospital_pin_code': ' Hospital Pin Code',

            'mobile_number': 'Mobile Number',

            'alternate_mobile_number': 'Alternate Mobile Number',

            'email': 'E-mail',

            'dob': 'Date of Birth',

            'wedding_date': 'Wedding Date',

            'id_proof': 'ID Proof ',

            'id_number': 'ID Number',

            'speciality': 'Speciality',

            'other_speciality': 'Other Speciality',

            'qualification': 'Qualification / Degree',

            'registration_number': 'Registration Number',

            'registration_year': 'Year',

            'medical_council': 'Medical Council',

            'visiting_physician': 'Are You a Visiting Physician / Consultant?',

            'associated_hospitals': 'Name the Hospitals / Clinics you are associated with',

            'legal_claims': 'Have any claims been made upon you or legal proceedings instituted or likely to be instituted?',

            'practice_duration': 'How long you have been practising?',

            'avg_patients_per_day': 'State the average no. of patients you are attending per day',

            'unqualified_staff_extension': 'Extension for unqualified staff required?',

            'annual_income': 'Your estimated annual income in Rs.',

            'insurance_cover': 'Insurance Cover required',

            # 'ref_doctor_1_name': "Doctor's Name (Reference 1)",

            # 'ref_doctor_1_contact': 'Contact Number (Reference 1)',

            # 'ref_doctor_1_location': 'Location (Reference 1)',

            # 'ref_doctor_2_name': "Doctor's Name (Reference 2)",

            # 'ref_doctor_2_contact': 'Contact Number (Reference 2)',

            # 'ref_doctor_2_location': 'Location (Reference 2)',

            'tenure_of_membership':'Tenure Of Membership (Legal Service)',

            'tenure_of_indemnity':'Tenure Of Indemnity ',

            'tplc_rep_name': "True Path Legal Consultant's Representative Name",

            'tplc_rep_email': "Email id of True Path Legal Consultant's Representative",

            'total_amount_paid': 'Total Amount Paid',

            'payment_details': 'Mode of Payment and Cheque / Ref. No.',

            'registration_certificate': 'Upload Registration Certificate',

            'selfie': 'Take a Selfie',

            'signature': 'Signature',

            'submission_date_time': 'Date and Time of Submission',

            'place_of_submission': 'Place of Submission',

        }





    def __init__(self, *args, **kwargs):

        super().__init__(*args, **kwargs)

        # Hide "Currently" and "Clear" sections

        self.fields['signature'].widget.initial_text = ''

        self.fields['signature'].widget.clear_checkbox_label = ''







class HospitalAndNursingHomeRegistrationForm(forms.ModelForm):

    choices_id_proof=[

            ('', 'Please Select'),

            ('Aadhar', 'Aadhar'),

            ('PAN', 'PAN'),

            ('Driving License', 'Driving License'),

            ('Passport', 'Passport'),

            ('GST Certificate (For Non-Individual)', 'GST Certificate (For Non-Individual)'),

            ('Incorporation Certificate (For Non Individuals)', 'Incorporation Certificate (For Non Individuals)')

        ]

    class Meta:

        model = HospitalAndNursingHomeRegistration

        # fields = '__all__'

        exclude = ['app_registraction_no','created_at', 'updated_at','status','user_id']# exclude = ['created_at', 'updated_at','app_registraction_no'] 

        widgets = {

            'hospital_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Medical Establishment Name'}),

            'proprietor_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Proprietor Name'}),

            'residence_address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Residence Address'}),

            'house_no': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'House No./ Flat No. / Block'}),

            'street': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Street / Road / Locality'}),

            'district': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'District'}),

            'state': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'State'}),

            'pin_code': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Pin Code'}),

            'hospital_address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital Address'}),

            'hospital_house_no': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'House No./ Flat No. / Block'}),

            'hospital_street': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Street / Road / Locality'}),

            'hospital_district': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Hospital District'}),

            'hospital_state': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Hospital State'}),

            'hospital_pin_code': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Hospital Pin Code'}),

            'mobile_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Mobile Number'}),

            'alternate_mobile_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Alternate Mobile Number'}),

            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter Email'}),

            'dob': forms.DateInput(attrs={'class': 'form-control', 'placeholder': 'Date of Birth (DD-MM-YYYY)', 'type': 'date'}),

            'wedding_date': forms.DateInput(attrs={'class': 'form-control', 'placeholder': 'Wedding Date (DD-MM-YYYY)', 'type': 'date'}),

            'id_proof': forms.Select(attrs={'class': 'form-control'},

                                     choices=[

                                                ('', 'Please Select'),

                                                ('Aadhar', 'Aadhar'),

                                                ('PAN', 'PAN'),

                                                ('Driving License', 'Driving License'),

                                                ('Passport', 'Passport'),

                                                ('GST Certificate (For Non-Individual)', 'GST Certificate (For Non-Individual)'),

                                                ('Incorporation Certificate (For Non Individuals)', 'Incorporation Certificate (For Non Individuals)')

                                            ]

                                                                            ),

            'id_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter ID Number'}),

            'registration_number_hospital': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Registration Number'}),

            'registration_year': forms.NumberInput(attrs={'class': 'form-control'}),

            'no_of_beds': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Number of Beds'}),

            'annual_opd': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Annual OPD'}),

            'annual_ipd': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Annual IPD'}),

            'facilities_available': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Facilities Available'}),

            'total_doctors': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Total Number of Doctors'}),

            'insurance_cover': forms.Select(attrs={'class': 'form-control'},

                                            choices=[

                                                ('', 'Please Select'),

                                                ('Yes', 'Yes'),

                                                ('No', 'No'),

                                            ]

                                            ),

            'coverage_amount': forms.Select(attrs={'class': 'form-control',},

                                choices=[

                                    ('', 'Please Select'),

                                    ('10 Lakh', '10 Lakh'),

                                    ('20 Lakh', '20 Lakh'),

                                    ('30 Lakh', '30 Lakh'),

                                    ('40 Lakh', '40 Lakh'),

                                    ('50 Lakh', '50 Lakh'),

                                    ('1 Crore', '1 Crore'),

                                    ('1.5 Crore', '1.5 Crore'),

                                    ('2 Crore', '2 Crore'),

                                    ('2.5 Crore', '2.5 Crore'),

                                    ('5 Crore', '5 Crore'),

                                ]

                                ),                                

            # 'ref_doctor_1_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Doctor 1 Name'}),

            # 'ref_doctor_1_contact': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Doctor 1 Contact'}),

            # 'ref_doctor_1_location': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Doctor 1 Location'}),

            # 'ref_doctor_2_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Doctor 2 Name'}),

            # 'ref_doctor_2_contact': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Doctor 2 Contact'}),

            # 'ref_doctor_2_location': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Doctor 2 Location'}),

            'tenure_of_membership':forms.TextInput(attrs={'class': 'form-control'}),

            'tenure_of_indemnity':forms.TextInput(attrs={'class': 'form-control'}),

            'tplc_rep_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': "True Path Legal Consultant's Representative Name"}),

            'tplc_rep_email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': "True Path Legal Consultant's Representative Email"}),

            'total_amount_paid': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Total Amount Paid'}),

            'payment_details': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Payment Mode / Cheque/Ref No.'}),

            'registration_certificate': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

            'selfie': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

            'signature': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

            'submission_date_time': forms.DateTimeInput(attrs={'class': 'form-control', 'placeholder': 'Submission Date and Time', 'type': 'datetime-local'}),

            'place_of_submission': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Place of Submission'}),

        }



        labels = {

            'hospital_name': 'Full Name of Medical Establishment',

            'proprietor_name': 'Name of Proprietor / Owner',

            'residence_address': 'Complete Residence Address',

            'house_no': 'House No./ Flat No. / Block',

            'street': 'Street / Road / Locality',

            'district': 'District',

            'state': 'State',

            'pin_code': 'Pin Code',

            'hospital_address': 'Hospital / Clinic Address',

            'hospital_house_no': 'Hospital House No./ Flat No. / Block',

            'hospital_street': 'Hospital Street / Road / Locality',

            'hospital_district': 'Hospital District',

            'hospital_state': 'Hospital State',

            'hospital_pin_code': 'Hospital Pin Code',

            'mobile_number': ' Mobile Number',

            'alternate_mobile_number': 'Alternate Mobile Number',

            'email': ' Email',

            'dob': 'Date of Birth (DD-MM-YYYY)',

            'wedding_date': 'Wedding Date (DD-MM-YYYY)',

            'id_proof': 'ID Proof ',

            'id_number': 'ID Number*',

            'registration_number_hospital': 'Hospital / Diagnostic Centre Registration Number',

            'no_of_beds': 'Total Number of Beds*',

            'annual_opd': 'Annual Outpatient Department (OPD)',

            'annual_ipd': 'Annual Inpatient Department (IPD)',

            'facilities_available': 'Available Facilities',

            'total_doctors': 'Total Number of Doctors Employed in Various Specialities',

            'insurance_cover': 'Insurance Cover required',

            # 'ref_doctor_1_name': 'Reference Doctor 1 Name',

            # 'ref_doctor_1_contact': 'Reference Doctor 1 Contact Number',

            # 'ref_doctor_1_location': 'Reference Doctor 1 Location',

            # 'ref_doctor_2_name': 'Reference Doctor 2 Name',

            # 'ref_doctor_2_contact': 'Reference Doctor 2 Contact Number',

            # 'ref_doctor_2_location': 'Reference Doctor 2 Location',

            'tenure_of_membership':'Tenure Of Membership (Legal Service)',

            'tenure_of_indemnity':'Tenure Of Indemnity ',

            'tplc_rep_name': "True Path Legal Consultant's Representative Name",

            'tplc_rep_email': "True Path Legal Consultant's Representative Email Address",

            'total_amount_paid': 'Total Amount Paid',

            'payment_details': 'Mode of Payment and Cheque/Ref. Number',

            'registration_certificate': 'Upload Registration Certificate',

            'selfie': 'Take a Selfie',

            'signature': 'Signature',

            'submission_date_time': 'Date and Time of Submission',

            'place_of_submission': 'Place of Submission*'

        }











class DiagnosticCentreRegistrationForm(forms.ModelForm):

    class Meta:

        model = DiagnosticCentreRegistration

        # fields = '__all__'

        exclude = ['app_registraction_no','created_at', 'updated_at','status','user_id']# exclude = ['created_at', 'updated_at','app_registraction_no'] 

        widgets = {

            'hospital_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter  Medical Establishment Name'}),

            'proprietor_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Proprietor / Owner Name'}),

            # 'residence_address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Residence Address'}),

            'house_no': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter House No./ Flat No. / Block'}),

            'street': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Street / Road / Locality'}),

            'district': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter District'}),

            'state': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter State'}),

            'pin_code': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Pin Code'}),

            'hospital_address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital / Clinic Address'}),

            'hospital_house_no': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital House No. / Flat No. / Block'}),

            'hospital_street': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital Street / Road / Locality'}),

            'hospital_district': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital District'}),

            'hospital_state': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital State'}),

            'hospital_pin_code': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital Pin Code'}),

            'mobile_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Mobile Number'}),

            'alternate_mobile_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Alternate Mobile Number'}),

            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter Email Address'}),

            'dob': forms.DateInput(attrs={'class': 'form-control', 'placeholder': 'Enter Date of Birth (DD-MM-YYYY)', 'type': 'date'}),

            'wedding_date': forms.DateInput(attrs={'class': 'form-control', 'placeholder': 'Enter Wedding Date (DD-MM-YYYY)', 'type': 'date'}),

            'id_proof': forms.Select(attrs={'class': 'form-control'},choices=[

                                                ('', 'Please Select'),

                                                ('Aadhar', 'Aadhar'),

                                                ('PAN', 'PAN'),

                                                ('Driving License', 'Driving License'),

                                                ('Passport', 'Passport'),

                                                ('GST Certificate (For Non-Individual)', 'GST Certificate (For Non-Individual)'),

                                                ('Incorporation Certificate (For Non Individuals)', 'Incorporation Certificate (For Non Individuals)')

                                            ]),

            'id_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter ID Number'}),

            'registration_number_hospital': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Hospital Registration Number'}),

            'registration_year': forms.NumberInput(attrs={'class': 'form-control'}),

            'annual_opd': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Annual OPD'}),

            'facilities_available': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Facilities Available'}),

            'total_doctors': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Total Doctors Count'}),

            'insurance_cover': forms.Select(attrs={'class': 'form-control'},choices=[

                                                ('', 'Please Select'),

                                                ('Yes', 'Yes'),

                                                ('No', 'No'),

                                            ]),

            'coverage_amount': forms.Select(attrs={'class': 'form-control',},

                                choices=[

                                     ('', 'Please Select'),

                                    ('10 Lakh', '10 Lakh'),

                                    ('20 Lakh', '20 Lakh'),

                                    ('30 Lakh', '30 Lakh'),

                                    ('40 Lakh', '40 Lakh'),

                                    ('50 Lakh', '50 Lakh'),

                                    ('1 Crore', '1 Crore'),

                                    ('1.5 Crore', '1.5 Crore'),

                                    ('2 Crore', '2 Crore'),

                                    ('2.5 Crore', '2.5 Crore'),

                                    ('5 Crore', '5 Crore'),

                                ]

                                ),  

            # 'ref_doctor_1_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Reference Doctor 1 Name'}),

            # 'ref_doctor_1_contact': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Reference Doctor 1 Contact Number'}),

            # 'ref_doctor_1_location': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Reference Doctor 1 Location'}),

            # 'ref_doctor_2_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Reference Doctor 2 Name'}),

            # 'ref_doctor_2_contact': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Reference Doctor 2 Contact Number'}),

            # 'ref_doctor_2_location': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Reference Doctor 2 Location'}),

            'tenure_of_membership':forms.TextInput(attrs={'class': 'form-control'}),

            'tenure_of_indemnity':forms.TextInput(attrs={'class': 'form-control'}),

            'tplc_rep_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': "Enter True Path Legal Consultant's Representative Name"}),

            'tplc_rep_email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': "Enter True Path Legal Consultant's Representative Email"}),

            'total_amount_paid': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter Total Amount Paid'}),

            'payment_details': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Mode of Payment and Cheque / Ref. No.'}),

            'registration_certificate': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

            'selfie': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

            'signature': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

            'submission_date_time': forms.DateTimeInput(attrs={'class': 'form-control', 'placeholder': 'Enter Date and Time of Submission', 'type': 'datetime-local'}),

            'place_of_submission': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter Place of Submission'}),

        }

        labels = {

            'hospital_name': 'Medical Establishment',

            'proprietor_name': 'Name of Proprietor / Owner',

            # 'residence_address': 'Complete Residence Address*',

            'house_no': 'House No./ Flat No. / Block',

            'street': 'Street / Road / Locality',

            'district': 'District',

            'state': 'State',

            'pin_code': 'Pin Code',

            'hospital_address': 'Hospital / Clinic Address',

            'hospital_house_no': 'Hospital House No./ Flat No. / Block',

            'hospital_street': 'Hospital Street / Road / Locality',

            'hospital_district': 'Hospital District',

            'hospital_state': 'Hospital State',

            'hospital_pin_code': 'Hospital Pin Code',

            'mobile_number': 'Mobile Number',

            'alternate_mobile_number': 'Alternate Mobile Number',

            'email': 'Email',

            'dob': 'Date of Birth (DD-MM-YYYY)*',

            'wedding_date': 'Wedding Date (DD-MM-YYYY)',

            'id_proof': 'Choose an ID Proof',

            'id_number': 'Enter Your ID Number',

            'registration_number_hospital': 'Hospital / Diagnostic Centre Registration Number',

            'annual_opd': 'Annual Outpatient Department (OPD)',

            'facilities_available': 'Available Facilities',

            'total_doctors': 'Total Number of Doctors Employed in Various Specialities',

            'insurance_cover': 'Insurance Cover required',

            # 'ref_doctor_1_name': 'Reference Doctor 1 Name',

            # 'ref_doctor_1_contact': 'Reference Doctor 1 Contact Number',

            # 'ref_doctor_1_location': 'Reference Doctor 1 Location',

            # 'ref_doctor_2_name': 'Reference Doctor 2 Name',

            # 'ref_doctor_2_contact': 'Reference Doctor 2 Contact Number',

            # 'ref_doctor_2_location': 'Reference Doctor 2 Location',

            'tenure_of_membership':'Tenure Of Membership (Legal Service)',

            'tenure_of_indemnity':'Tenure Of Indemnity ',

            'tplc_rep_name': "True Path Legal Consultant's Representative Name",

            'tplc_rep_email': "True Path Legal Consultant's Representative Email Address",

            'total_amount_paid': 'Total Amount Paid',

            'payment_details': 'Mode of Payment and Cheque/Ref. Number',

            'registration_certificate': 'Upload Registration Certificate',

            'selfie': 'Take a Selfie',

            'signature': 'Signature',

            'submission_date_time': 'Date and Time of Submission',

            'place_of_submission': 'Place of Submission*'

        }







# class PaymentFormsDetailsForm(forms.ModelForm):

#     class Meta:

#         model = PaymentFormsDtailsModel

#         # fields = '__all__'

#         exclude = ['created_at', 'updated_at','status']

#         # Adding labels and widgets for the fields

#         labels = {

#             # 'member_status': 'Member Status',

#             'member_reg_no': 'Member Registration No.',

#             'insured_type': 'Insured Type',
#             'doctor_nameor_establised': 'Doctor Name or Establishment',

#             'proprietor_name': 'Proprietor Name',

#             # 'insured_name': 'Insured Name',

#             'speciality': 'Speciality',

#             'house_no': 'House Number',

#             'street': 'Street',

#             'state': 'State',

#             'city': 'City',

#             'pincode': 'Pincode',

#             'mobile1': 'Mobile Number 1',

#             'mobile2': 'Mobile Number 2 (Optional)',

#             'email': 'Email Address',

#             'plan': 'Plan',

#             'total_amount': 'Total Amount (Inc. GST) **',

#             'customer_id_type': 'Customer ID Type',

#             'customer_id_number': 'Customer ID Number',

#             'payment_type': 'Payment Type',

#             'additional_member_id': 'Additional Member ID',

#             'selfie': 'Selfie (Optional)',

#             'document': 'Document (Optional)',

#             'remarks': 'Remarks (Optional)',

#             'place_of_submission': 'Place of Submission (Optional)',

#         }

#         doc_reg_choices = [(data.app_registraction_no, data.app_registraction_no) for data in DoctorRegistration.objects.filter(status=1)]

#         hos_reg_choices = [(data.app_registraction_no, data.app_registraction_no) for data in HospitalAndNursingHomeRegistration.objects.filter(status=1)]

#         d_center_reg_choices = [(data.app_registraction_no, data.app_registraction_no) for data in DiagnosticCentreRegistration.objects.filter(status=1)]

#         member_reg_no_choice=[('', 'Select'),]+ doc_reg_choices + hos_reg_choices + d_center_reg_choices

#         widgets = {

#             'member_reg_no': forms.Select(attrs={'class': 'form-control', },choices=member_reg_no_choice),

#             'insured_type': forms.Select(attrs={'class': 'form-control', 'placeholder': 'Enter insured type'},choices=[

#                 ('', 'Select'),

#                 ('Doctor', 'Doctor'),

#                 ('Hospital', 'Hospital'),

#                 ('Diagnostic', 'Diagnostic'),

#             ]),

#             'doctor_nameor_establised': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter doctor name or establishment',}),

#             'proprietor_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter proprietor name'}),

#             # 'insured_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter insured name'}),

#             'speciality': forms.Select(attrs={'class': 'form-control', },    choices = [

#                             ('', 'Select'),

#                             ("Plastic and Cosmetic Surgeon", "Plastic and Cosmetic Surgeon"),

#                             ("Cosmetic Surgeon", "Cosmetic Surgeon"),

#                             ("Dermatologist and Cosmetic Surgeon", "Dermatologist and Cosmetic Surgeon"),

#                             ("Hair Transplant Surgeon", "Hair Transplant Surgeon"),

#                             ("Anaesthetist", "Anaesthetist"),

#                             ("Cancer Surgeon", "Cancer Surgeon"),

#                             ("Bariatric Surgeon", "Bariatric Surgeon"),

#                             ("Cardiothoracic Surgeon", "Cardiothoracic Surgeon"),

#                             ("Cardiovascular Surgeon", "Cardiovascular Surgeon"),

#                             ("Critical Care Specialist", "Critical Care Specialist"),

#                             ("Dental Surgeon", "Dental Surgeon"),

#                             ("ENT Surgeon", "ENT Surgeon"),

#                             ("Eye Surgeon", "Eye Surgeon"),

#                             ("Gastroenterosurgeon", "Gastroenterosurgeon"),

#                             ("General Surgeon", "General Surgeon"),

#                             ("Interventional Cardiologist", "Interventional Cardiologist"),

#                             ("Nephrosurgeon", "Nephrosurgeon"),

#                             ("Neurosurgeon", "Neurosurgeon"),

#                             ("Obstetrics & Gynaecologist", "Obstetrics & Gynaecologist"),

#                             ("Oncosurgeon", "Oncosurgeon"),

#                             ("Oncologist", "Oncologist"),

#                             ("Opthalmologist", "Opthalmologist"),

#                             ("Oral & Maxillofacial Surgeon", "Oral & Maxillofacial Surgeon"),

#                             ("Orthopaedic Surgeon", "Orthopaedic Surgeon"),

#                             ("Paediatric Surgeon", "Paediatric Surgeon"),

#                             ("Thoracic Surgeon", "Thoracic Surgeon"),

#                             ("Urosurgeon", "Urosurgeon"),

#                             ("Cancer Physician", "Cancer Physician"),

#                             ("Acupuncturist", "Acupuncturist"),

#                             ("Cardiologist", "Cardiologist"),

#                             ("Chest and TB Specialist", "Chest and TB Specialist"),

#                             ("Child Specialist", "Child Specialist"),

#                             ("Consultant Physician", "Consultant Physician"),

#                             ("Dermatologist", "Dermatologist"),

#                             ("Diabetologist", "Diabetologist"),

#                             ("ENT Physician", "ENT Physician"),

#                             ("Endocrinologist", "Endocrinologist"),

#                             ("Gastroenterologist", "Gastroenterologist"),

#                             ("General Physician", "General Physician"),

#                             ("Haematologist", "Haematologist"),

#                             ("Microbiologist", "Microbiologist"),

#                             ("Neonatologist", "Neonatologist"),

#                             ("Nephrologist", "Nephrologist"),

#                             ("Neurologist", "Neurologist"),

#                             ("Occupational Therapist", "Occupational Therapist"),

#                             ("Paediatrician", "Paediatrician"),

#                             ("Pathologist", "Pathologist"),

#                             ("Physiotherapist", "Physiotherapist"),

#                             ("Proctologist", "Proctologist"),

#                             ("Psychiatrist", "Psychiatrist"),

#                             ("Pulmonologist", "Pulmonologist"),

#                             ("Radiologist", "Radiologist"),

#                             ("Rheumatologist", "Rheumatologist"),

#                             ("Skin Specialist", "Skin Specialist"),

#                             ("Ultrasonologist", "Ultrasonologist"),

#                             ("Urologist", "Urologist"),

#                             ("Venerologist", "Venerologist"),

#                             ("Medical Establishment", "Medical Establishment"),

#                             ("Oral and Maxillofacial Surgeon with Cosmetic Surgery", "Oral and Maxillofacial Surgeon with Cosmetic Surgery"),

#                             ("Anaesthetist and Critical Care Specialist", "Anaesthetist and Critical Care Specialist"),

#                             ("Plastic Surgeon", "Plastic Surgeon"),

#                             ("General & Laparoscopic Surgeon", "General & Laparoscopic Surgeon"),

#                         ]),

#             'house_no': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter house number'}),

#             'street': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter street name'}),

#             'state': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter state'}),

#             'city': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter city'}),

#             'pincode': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter pincode'}),

#             'mobile1': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number 1'}),

#             'mobile2': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number 2 (Optional)'}),

#             'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter email address'}),

#             'plan': forms.Select(attrs={'class': 'form-control', },choices=[

#                                                                         ("", "Select"),  # Default "Select" option

#                                                                         ("Only Membership", "Only Membership"),

#                                                                         ("Membership + Indemnity Insurance", "Membership + Indemnity Insurance"),

#                                                                         ("Only Indemnity Insurance", "Only Indemnity Insurance"),

#                                                                         ("Pre - Membership Fee / Other Charges", "Pre - Membership Fee / Other Charges"),

#                                                                     ]),

#             'total_amount': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter total amount'}),

#             'customer_id_type': forms.Select(attrs={'class': 'form-control', },choices= [

#                                                                                     ("", "Please Select"),  # Default "Please Select" option

#                                                                                     ("Aadhar", "Aadhar"),

#                                                                                     ("PAN", "PAN"),

#                                                                                     ("Driving License", "Driving License"),

#                                                                                     ("Passport", "Passport"),

#                                                                                     ("GST Certificate (For Non-Individual)", "GST Certificate (For Non-Individual)"),

#                                                                                     ("Incorporation Certificate (For Non Individuals)", "Incorporation Certificate (For Non Individuals)"),

#                                                                                 ]),

#             'customer_id_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter customer ID number'}),

#             'payment_type': forms.Select(attrs={'class': 'form-control', },choices=[

#                 ("", "Please Select"), 

#                 ("Single", "Single"),

#                  ("Combined", "Combined"),

#             ]),

#             'additional_member_id': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter additional member ID'}),

#             'selfie': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

#             'document': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),

#             'remarks': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Enter remarks (Optional)', 'rows': 3}),

#             'place_of_submission': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter place of submission (Optional)'}),

#         }

#         proprietor_name  = forms.TextInput(required=False)







class PaymentFormsDetailsForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):

        super(PaymentFormsDetailsForm, self).__init__(*args, **kwargs)

        self.order_fields([

            'member_reg_no', 'insured_type', 'doctor_nameor_establised', 'proprietor_name',

            'speciality', 'house_no', 'street', 'state', 'city', 'pincode', 'mobile1', 'mobile2',

            'email', 'plan', 'membership_tenure', 'indemnity_amount', 'indemnity_tenure',

            'total_amount', 'customer_id_type', 'customer_id_number', 'payment_type',

            'additional_member_id', 'selfie', 'document', 'remarks', 'place_of_submission'

        ])

        # Dynamic labels

        self.fields['member_reg_no'].label = 'Member Registration No.'

        self.fields['insured_type'].label = 'Insured Type'

        self.fields['doctor_nameor_establised'].label = 'Doctor Name or Establishment'

        self.fields['proprietor_name'].label = 'Proprietor Name'

        self.fields['speciality'].label = 'Speciality'

        self.fields['house_no'].label = 'House Number'

        self.fields['street'].label = 'Street'

        self.fields['state'].label = 'State'

        self.fields['city'].label = 'City'

        self.fields['pincode'].label = 'Pincode'

        self.fields['mobile1'].label = 'Mobile Number 1'

        self.fields['mobile2'].label = 'Mobile Number 2 '

        self.fields['email'].label = 'Email Address'

        self.fields['plan'].label = 'Plan'

        self.fields['membership_tenure'].label = 'Membership Tenure'

        self.fields['indemnity_amount'].label = 'Indemnity Amount'

        self.fields['indemnity_tenure'].label = 'Indemnity Tenure'

        self.fields['total_amount'].label = 'Total Amount (Inc. GST) '

        self.fields['customer_id_type'].label = 'Customer ID Type'

        self.fields['customer_id_number'].label = 'Customer ID Number'

        self.fields['payment_type'].label = 'Payment Type'

        self.fields['additional_member_id'].label = 'Additional Member ID'

        self.fields['selfie'].label = 'Selfie '

        self.fields['document'].label = 'Document '

        self.fields['remarks'].label = 'Remarks '

        self.fields['place_of_submission'].label = 'Place of Submission'



        # Dynamic choices

        doc_reg_choices = [(data.app_registraction_no, f'{data.app_registraction_no} (Doctor)') for data in DoctorRegistration.objects.filter(status=1)]

        hos_reg_choices = [(data.app_registraction_no, f'{data.app_registraction_no} (Hospital)') for data in HospitalAndNursingHomeRegistration.objects.filter(status=1)]

        d_center_reg_choices = [(data.app_registraction_no, f'{data.app_registraction_no} (Diagnostic)') for data in DiagnosticCentreRegistration.objects.filter(status=1)]

        member_reg_no_choice = [('', 'Select')] + doc_reg_choices + hos_reg_choices + d_center_reg_choices



        # Dynamic widgets

        self.fields['member_reg_no'].widget = forms.Select(attrs={'class': 'form-control'}, choices=member_reg_no_choice)

        self.fields['insured_type'].widget = forms.Select(attrs={'class': 'form-control'}, choices=[

            ('', 'Select'),

            ('Doctor', 'Doctor'),

            ('Hospital', 'Hospital'),

            ('Diagnostic', 'Diagnostic'),

        ])

        self.fields['doctor_nameor_establised'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter doctor name or establishment'})

        self.fields['proprietor_name'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter proprietor name'})

        # self.fields['proprietor_name'].required = False

        

        self.fields['speciality'].widget = forms.Select(attrs={'class': 'form-control'}, choices=[

                            ('', 'Select'),

                            ("Plastic and Cosmetic Surgeon", "Plastic and Cosmetic Surgeon"),                  

                            ("Cosmetic Surgeon", "Cosmetic Surgeon"),

                            ("Dermatologist and Cosmetic Surgeon", "Dermatologist and Cosmetic Surgeon"),

                            ("Hair Transplant Surgeon", "Hair Transplant Surgeon"),

                            ("Anaesthetist", "Anaesthetist"),

                            ("Cancer Surgeon", "Cancer Surgeon"),

                            ("Bariatric Surgeon", "Bariatric Surgeon"),

                            ("Cardiothoracic Surgeon", "Cardiothoracic Surgeon"),

                            ("Cardiovascular Surgeon", "Cardiovascular Surgeon"),

                            ("Critical Care Specialist", "Critical Care Specialist"),

                            ("Dental Surgeon", "Dental Surgeon"),

                            ("ENT Surgeon", "ENT Surgeon"),

                            ("Eye Surgeon", "Eye Surgeon"),

                            ("Gastroenterosurgeon", "Gastroenterosurgeon"),

                            ("General Surgeon", "General Surgeon"),

                            ("Interventional Cardiologist", "Interventional Cardiologist"),

                            ("Nephrosurgeon", "Nephrosurgeon"),

                            ("Neurosurgeon", "Neurosurgeon"),

                            ("Obstetrics & Gynaecologist", "Obstetrics & Gynaecologist"),

                            ("Oncosurgeon", "Oncosurgeon"),

                            ("Oncologist", "Oncologist"),

                            ("Opthalmologist", "Opthalmologist"),

                            ("Oral & Maxillofacial Surgeon", "Oral & Maxillofacial Surgeon"),

                            ("Orthopaedic Surgeon", "Orthopaedic Surgeon"),

                            ("Paediatric Surgeon", "Paediatric Surgeon"),

                            ("Thoracic Surgeon", "Thoracic Surgeon"),

                            ("Urosurgeon", "Urosurgeon"),

                            ("Cancer Physician", "Cancer Physician"),

                            ("Acupuncturist", "Acupuncturist"),

                            ("Cardiologist", "Cardiologist"),

                            ("Chest and TB Specialist", "Chest and TB Specialist"),

                            ("Child Specialist", "Child Specialist"),

                            ("Consultant Physician", "Consultant Physician"),

                            ("Dermatologist", "Dermatologist"),

                            ("Diabetologist", "Diabetologist"),

                            ("ENT Physician", "ENT Physician"),

                            ("Endocrinologist", "Endocrinologist"),

                            ("Gastroenterologist", "Gastroenterologist"),

                            ("General Physician", "General Physician"),

                            ("Haematologist", "Haematologist"),

                            ("Microbiologist", "Microbiologist"),

                            ("Neonatologist", "Neonatologist"),

                            ("Nephrologist", "Nephrologist"),

                            ("Neurologist", "Neurologist"),

                            ("Occupational Therapist", "Occupational Therapist"),

                            ("Paediatrician", "Paediatrician"),

                            ("Pathologist", "Pathologist"),

                            ("Physiotherapist", "Physiotherapist"),

                            ("Proctologist", "Proctologist"),

                            ("Psychiatrist", "Psychiatrist"),

                            ("Pulmonologist", "Pulmonologist"),

                            ("Radiologist", "Radiologist"),

                            ("Rheumatologist", "Rheumatologist"),

                            ("Skin Specialist", "Skin Specialist"),

                            ("Ultrasonologist", "Ultrasonologist"),

                            ("Urologist", "Urologist"),

                            ("Venerologist", "Venerologist"),

                            ("Medical Establishment", "Medical Establishment"),

                            ("Oral and Maxillofacial Surgeon with Cosmetic Surgery", "Oral and Maxillofacial Surgeon with Cosmetic Surgery"),

                            ("Anaesthetist and Critical Care Specialist", "Anaesthetist and Critical Care Specialist"),

                            ("Plastic Surgeon", "Plastic Surgeon"),

                            ("General & Laparoscopic Surgeon", "General & Laparoscopic Surgeon"),

        ])

        self.fields['house_no'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter house number'})

        self.fields['street'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter street name'})

        self.fields['state'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter state'})

        self.fields['city'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter city'})

        self.fields['pincode'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter pincode'})

        self.fields['mobile1'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number 1'})

        self.fields['mobile2'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number 2 '})

        self.fields['email'].widget = forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter email address'})

        self.fields['plan'].widget = forms.Select(attrs={'class': 'form-control'}, choices=[

            ("", "Select"),

            ("Only Membership", "Only Membership"),

            ("Membership + Indemnity Insurance", "Membership + Indemnity Insurance"),

            ("Only Indemnity Insurance", "Only Indemnity Insurance"),

            ("Pre - Membership Fee / Other Charges", "Pre - Membership Fee / Other Charges"),

        ])

        self.fields['membership_tenure'].widget = forms.TextInput(attrs={'class': 'form-control','style':'display:none'})

        self.fields['indemnity_amount'].widget = forms.NumberInput(attrs={'class': 'form-control', 'style':'display:none'})

        self.fields['indemnity_tenure'].widget = forms.TextInput(attrs={'class': 'form-control', 'style':'display:none'})

        self.fields['total_amount'].widget = forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter total amount'})

        self.fields['customer_id_type'].widget = forms.Select(attrs={'class': 'form-control'}, choices=[

            ("", "Please Select"),

            ("Aadhar", "Aadhar"),

            ("PAN", "PAN"),

            ("Driving License", "Driving License"),

            ("Passport", "Passport"),

            ("GST Certificate (For Non-Individual)", "GST Certificate (For Non-Individual)"),

            ("Incorporation Certificate (For Non Individuals)", "Incorporation Certificate (For Non Individuals)"),

        ])

        self.fields['customer_id_number'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter customer ID number'})

        self.fields['payment_type'].widget = forms.Select(attrs={'class': 'form-control'}, choices=[

            ("", "Please Select"),

            ("Single", "Single"),

            ("Combined", "Combined"),

        ])

        self.fields['additional_member_id'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter additional member ID'})

        self.fields['selfie'].widget = forms.ClearableFileInput(attrs={'class': 'form-control-file'})

        self.fields['document'].widget = forms.ClearableFileInput(attrs={'class': 'form-control-file'})

        self.fields['remarks'].widget = forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Enter remarks (Optional)', 'rows': 3})

        self.fields['place_of_submission'].widget = forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter place of submission (Optional)'})



        self.fields['additional_member_id'].required = False

    class Meta:

        model = PaymentFormsDtailsModel

        exclude = ['created_at', 'updated_at', 'status','paymentID','payment_date','user_id']









class LeadForm(forms.ModelForm):

    class Meta:

        model = LeadModel

        # fields = '__all__'
        exclude = ['created_at', 'updated_at','status','user_id']

        

        # Customize widgets for better UI

        widgets = {

            'lead_date': forms.DateInput(attrs={'class': 'form-control','type': 'date'}),

            'member_type': forms.Select(attrs={'class': 'form-control'},choices=  [('', 'Select'),

                                                                                        ('Doctor', 'Doctor'),

                                                                                        ('Hospital', 'Hospital'),

                                                                                        ('Diagnostic Center', 'Diagnostic Center'),

                                                                                    ]),

            'doctor_name': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Doctor Name'}),

            'hospital_name': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Hospital Name'}),

            'diagnostic_name': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Diagnostic Center'}),

            'contact_person': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Contact Person'}),

            'category': forms.Select(attrs={'class': 'form-control'},choices=[

                            ('', 'Select'),

                            ("Plastic and Cosmetic Surgeon", "Plastic and Cosmetic Surgeon"),                  

                            ("Cosmetic Surgeon", "Cosmetic Surgeon"),

                            ("Dermatologist and Cosmetic Surgeon", "Dermatologist and Cosmetic Surgeon"),

                            ("Hair Transplant Surgeon", "Hair Transplant Surgeon"),

                            ("Anaesthetist", "Anaesthetist"),

                            ("Cancer Surgeon", "Cancer Surgeon"),

                            ("Bariatric Surgeon", "Bariatric Surgeon"),

                            ("Cardiothoracic Surgeon", "Cardiothoracic Surgeon"),

                            ("Cardiovascular Surgeon", "Cardiovascular Surgeon"),

                            ("Critical Care Specialist", "Critical Care Specialist"),

                            ("Dental Surgeon", "Dental Surgeon"),

                            ("ENT Surgeon", "ENT Surgeon"),

                            ("Eye Surgeon", "Eye Surgeon"),

                            ("Gastroenterosurgeon", "Gastroenterosurgeon"),

                            ("General Surgeon", "General Surgeon"),

                            ("Interventional Cardiologist", "Interventional Cardiologist"),

                            ("Nephrosurgeon", "Nephrosurgeon"),

                            ("Neurosurgeon", "Neurosurgeon"),

                            ("Obstetrics & Gynaecologist", "Obstetrics & Gynaecologist"),

                            ("Oncosurgeon", "Oncosurgeon"),

                            ("Oncologist", "Oncologist"),

                            ("Opthalmologist", "Opthalmologist"),

                            ("Oral & Maxillofacial Surgeon", "Oral & Maxillofacial Surgeon"),

                            ("Orthopaedic Surgeon", "Orthopaedic Surgeon"),

                            ("Paediatric Surgeon", "Paediatric Surgeon"),

                            ("Thoracic Surgeon", "Thoracic Surgeon"),

                            ("Urosurgeon", "Urosurgeon"),

                            ("Cancer Physician", "Cancer Physician"),

                            ("Acupuncturist", "Acupuncturist"),

                            ("Cardiologist", "Cardiologist"),

                            ("Chest and TB Specialist", "Chest and TB Specialist"),

                            ("Child Specialist", "Child Specialist"),

                            ("Consultant Physician", "Consultant Physician"),

                            ("Dermatologist", "Dermatologist"),

                            ("Diabetologist", "Diabetologist"),

                            ("ENT Physician", "ENT Physician"),

                            ("Endocrinologist", "Endocrinologist"),

                            ("Gastroenterologist", "Gastroenterologist"),

                            ("General Physician", "General Physician"),

                            ("Haematologist", "Haematologist"),

                            ("Microbiologist", "Microbiologist"),

                            ("Neonatologist", "Neonatologist"),

                            ("Nephrologist", "Nephrologist"),

                            ("Neurologist", "Neurologist"),

                            ("Occupational Therapist", "Occupational Therapist"),

                            ("Paediatrician", "Paediatrician"),

                            ("Pathologist", "Pathologist"),

                            ("Physiotherapist", "Physiotherapist"),

                            ("Proctologist", "Proctologist"),

                            ("Psychiatrist", "Psychiatrist"),

                            ("Pulmonologist", "Pulmonologist"),

                            ("Radiologist", "Radiologist"),

                            ("Rheumatologist", "Rheumatologist"),

                            ("Skin Specialist", "Skin Specialist"),

                            ("Ultrasonologist", "Ultrasonologist"),

                            ("Urologist", "Urologist"),

                            ("Venerologist", "Venerologist"),

                            ("Medical Establishment", "Medical Establishment"),

                            ("Oral and Maxillofacial Surgeon with Cosmetic Surgery", "Oral and Maxillofacial Surgeon with Cosmetic Surgery"),

                            ("Anaesthetist and Critical Care Specialist", "Anaesthetist and Critical Care Specialist"),

                            ("Plastic Surgeon", "Plastic Surgeon"),

                            ("General & Laparoscopic Surgeon", "General & Laparoscopic Surgeon"),

                        ]),

            # 'medical_establishment': forms.Select(attrs={'class': 'form-control'},choices=[]),

            'mobile': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Mobile Number'}),

            'mobile2': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Second Mobile Number (Optional)'}),

            'email': forms.EmailInput(attrs={'class': 'form-control','placeholder': 'Enter Email'}),

            # 'member_status': forms.Select(attrs={'class': 'form-control'}),

            # 'landline': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Landline (Optional)'}),

            # 'address1': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Address 1'}),

            # 'address2': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Address 2 (Optional)'}),

            'state': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter State'}),

            'city': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter City'}),

            'employee': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter Employee (Optional)'}),

            'remarks': forms.Textarea(attrs={'class': 'form-control w-100','cols': '','rows': '4' ,'placeholder': 'Enter Remarks (Optional)'}),

        }

        

        # Add custom labels for each field

        labels = {

            'lead_date': 'Lead Date*',

            'member_type': 'Member Type*',

            'doctor_name': 'Doctor Name*',

            'hospital_name':'Hospital Name',

            'diagnostic_name':'Diagnostic Center Name',

            'contact_person': 'Contact Person*',

            'category': 'Category',

            'mobile': 'Mobile*',

            'mobile2': 'Mobile2',

            'email': 'Email ',

            'member_status': 'Member Status',

            'landline': 'Landline',

            'address1': 'Address 1* (Hospital)',

            'address2': 'Address 2*',

            'state': 'State',

            'city': 'City',

            'employee': 'Employee',

            'remarks': 'Remarks*'

        }



class AppointmentForm(forms.ModelForm):

    class Meta:

        model = AppointmentModel

        fields = ['appointment_date', 'employee_sales', 'from_time', 'to_time']

        widgets = {

            'appointment_date': forms.DateInput(attrs={

                'type': 'date', 

                'class': 'form-control', 

                'required': True

            }),

            'employee_sales': forms.TextInput(attrs={

                'class': 'form-control', 

                'placeholder': 'Enter employee sales', 

                'required': True

            }),

            'from_time': forms.TimeInput(attrs={

                'type': 'time', 

                'class': 'form-control', 

                'required': True

            }),

            'to_time': forms.TimeInput(attrs={

                'type': 'time', 

                'class': 'form-control', 

                'required': True

            }),

        }

        labels = {

            'appointment_date': 'Appointment Date',

            'employee_sales': 'Employee Sales',

            'from_time': 'From Time',

            'to_time': 'To Time',

        }









# class ProposalDetailsForm(forms.ModelForm):

#     class Meta:

#         model = ProposalDetailsModel

#         exclude = ['created_at','updated_at','status']



#         labels = {

#             'name': 'Name',

#             'email': 'Email',

#             'mobile_no': 'Mobile Number',

#             # 'created_at': 'Created At',

#             # 'updated_at': 'Updated At',

#             # 'status': 'Status',

#         }



#         widgets = {

#             'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter  name'}),

#             'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter email address'}),

#             'mobile_no': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number'}),

#             # 'created_at': forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'datetime-local'}),

#             # 'updated_at': forms.DateTimeInput(attrs={'class': 'form-control', 'type': 'datetime-local', 'readonly': 'readonly'}),

#             # 'status': forms.NumberInput(attrs={'class': 'form-control'}),

#         }







class ProposalExtraDetailsForm(forms.ModelForm):

    class Meta:

        model = ProposalExtraDetailsModel

        # fields = ['member_type', 'member_name', 'hospital_name', 'specialization', 'mobile', 'city', 'special_mentions']

        exclude = ['created_at','updated_at','status','proposal_no','user_id']

        

        labels = {

            'member_type': 'Member Type',

            'member_name': 'Member Name',

            'hospital_name': 'Hospital Name',

            'specialization': 'Specialization',

            'mobile': 'Mobile Number',

            'city': 'City',

            'special_mentions': 'Special Mentions',

        }



        widgets = {

            'member_type': forms.Select(attrs={'class': 'form-control'},choices=[

                                                                    ('', 'Select'),

                                                                    ('Doctor', 'Doctor'),

                                                                    ('Hospital', 'Hospital'),

                                                                    ('Diagnostic', 'Diagnostic'),

									('Society/Association', 'Society/Association'),
                                                                ]),

            'member_name': forms.TextInput(attrs={'class': 'form-control'}),

            'hospital_name': forms.TextInput(attrs={'class': 'form-control'}),

            'specialization': forms.Select(attrs={'class': 'form-control'},choices=[

                            ('', 'Select'),

                            ("Plastic and Cosmetic Surgeon", "Plastic and Cosmetic Surgeon"),                  

                            ("Cosmetic Surgeon", "Cosmetic Surgeon"),

                            ("Dermatologist and Cosmetic Surgeon", "Dermatologist and Cosmetic Surgeon"),

                            ("Hair Transplant Surgeon", "Hair Transplant Surgeon"),

                            ("Anaesthetist", "Anaesthetist"),

                            ("Cancer Surgeon", "Cancer Surgeon"),

                            ("Bariatric Surgeon", "Bariatric Surgeon"),

                            ("Cardiothoracic Surgeon", "Cardiothoracic Surgeon"),

                            ("Cardiovascular Surgeon", "Cardiovascular Surgeon"),

                            ("Critical Care Specialist", "Critical Care Specialist"),

                            ("Dental Surgeon", "Dental Surgeon"),

                            ("ENT Surgeon", "ENT Surgeon"),

                            ("Eye Surgeon", "Eye Surgeon"),

                            ("Gastroenterosurgeon", "Gastroenterosurgeon"),

                            ("General Surgeon", "General Surgeon"),

                            ("Interventional Cardiologist", "Interventional Cardiologist"),

                            ("Nephrosurgeon", "Nephrosurgeon"),

                            ("Neurosurgeon", "Neurosurgeon"),

                            ("Obstetrics & Gynaecologist", "Obstetrics & Gynaecologist"),

                            ("Oncosurgeon", "Oncosurgeon"),

                            ("Oncologist", "Oncologist"),

                            ("Opthalmologist", "Opthalmologist"),

                            ("Oral & Maxillofacial Surgeon", "Oral & Maxillofacial Surgeon"),

                            ("Orthopaedic Surgeon", "Orthopaedic Surgeon"),

                            ("Paediatric Surgeon", "Paediatric Surgeon"),

                            ("Thoracic Surgeon", "Thoracic Surgeon"),

                            ("Urosurgeon", "Urosurgeon"),

                            ("Cancer Physician", "Cancer Physician"),

                            ("Acupuncturist", "Acupuncturist"),

                            ("Cardiologist", "Cardiologist"),

                            ("Chest and TB Specialist", "Chest and TB Specialist"),

                            ("Child Specialist", "Child Specialist"),

                            ("Consultant Physician", "Consultant Physician"),

                            ("Dermatologist", "Dermatologist"),

                            ("Diabetologist", "Diabetologist"),

                            ("ENT Physician", "ENT Physician"),

                            ("Endocrinologist", "Endocrinologist"),

                            ("Gastroenterologist", "Gastroenterologist"),

                            ("General Physician", "General Physician"),

                            ("Haematologist", "Haematologist"),

                            ("Microbiologist", "Microbiologist"),

                            ("Neonatologist", "Neonatologist"),

                            ("Nephrologist", "Nephrologist"),

                            ("Neurologist", "Neurologist"),

                            ("Occupational Therapist", "Occupational Therapist"),

                            ("Paediatrician", "Paediatrician"),

                            ("Pathologist", "Pathologist"),

                            ("Physiotherapist", "Physiotherapist"),

                            ("Proctologist", "Proctologist"),

                            ("Psychiatrist", "Psychiatrist"),

                            ("Pulmonologist", "Pulmonologist"),

                            ("Radiologist", "Radiologist"),

                            ("Rheumatologist", "Rheumatologist"),

                            ("Skin Specialist", "Skin Specialist"),

                            ("Ultrasonologist", "Ultrasonologist"),

                            ("Urologist", "Urologist"),

                            ("Venerologist", "Venerologist"),

                            ("Medical Establishment", "Medical Establishment"),

                            ("Oral and Maxillofacial Surgeon with Cosmetic Surgery", "Oral and Maxillofacial Surgeon with Cosmetic Surgery"),

                            ("Anaesthetist and Critical Care Specialist", "Anaesthetist and Critical Care Specialist"),

                            ("Plastic Surgeon", "Plastic Surgeon"),

                            ("General & Laparoscopic Surgeon", "General & Laparoscopic Surgeon"),

                        ]),

            'mobile': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number'}),

            'city': forms.Select(attrs={'class': 'form-control'},choices=[('', 'Select'),('Agra', 'Agra'), ('Port Blair', 'Port Blair'), ('Adilabad', 'Adilabad'), ('Anantapur', 'Anantapur'), ('Chittoor', 'Chittoor'), ('Cuddapah', 'Cuddapah'), ('East Godavari', 'East Godavari'), ('Guntur', 'Guntur'), ('Hyderabad', 'Hyderabad'), ('Karimnagar', 'Karimnagar'), ('Khammam', 'Khammam'), ('Krishna', 'Krishna'), ('Kurnool', 'Kurnool'), ('Mahabubnagar', 'Mahabubnagar'), ('Medak', 'Medak'), ('Nalgonda', 'Nalgonda'), ('Nellore', 'Nellore'), ('Nizamabad', 'Nizamabad'), ('Prakasam', 'Prakasam'), ('Rangareddy', 'Rangareddy'), ('Srikakulam', 'Srikakulam'), ('Vijayawada', 'Vijayawada'), ('Visakhapatnam', 'Visakhapatnam'), ('Vizianagaram', 'Vizianagaram'), ('Warangal', 'Warangal'), ('Etawah', 'Etawah'), ('West Godavari', 'West Godavari'), ('Anjaw', 'Anjaw'), ('Changlang', 'Changlang'), ('Dibang Valley', 'Dibang Valley'), ('East Kameng', 'East Kameng'), ('East Siang', 'East Siang'), ('Kurung Kumey', 'Kurung Kumey'), ('Lower Dibang Valley', 'Lower Dibang Valley'), ('Lower Subansiri', 'Lower Subansiri'), ('Arunachal Pradesh- PapumPare', 'Arunachal Pradesh- PapumPare'), ('Jawang', 'Jawang'), ('Upper Siang', 'Upper Siang'), ('Upper Subansiri', 'Upper Subansiri'), ('West Kameng', 'West Kameng'), ('West Siang', 'West Siang'), ('Barpeta', 'Barpeta'), ('Bongaigaon', 'Bongaigaon'), ('Cachar', 'Cachar'), ('Darrang', 'Darrang'), ('Dhemaji', 'Dhemaji'), ('Dhubri', 'Dhubri'), ('Dibrugarh', 'Dibrugarh'), ('Goalpara', 'Goalpara'), ('Golaghat', 'Golaghat'), ('Guwahati', 'Guwahati'), ('Hailakandi', 'Hailakandi'), ('Jorhat', 'Jorhat'), ('Kamrup', 'Kamrup'), ('Karimganj', 

                'Karimganj'), ('Marigaon', 'Marigaon'), ('Nagaon', 'Nagaon'), ('Nalbari', 'Nalbari'), ('North Cachar Hills', 'North Cachar Hills'), ('Silchar', 'Silchar'), ('Sivasagar', 'Sivasagar'), ('Sonitpur', 'Sonitpur'), 

                ('Tinsukia', 'Tinsukia'), ('Karbi Anglong', 'Karbi Anglong'), ('Argaria', 'Argaria'), ('Aurangabad', 'Aurangabad'), ('Banka', 'Banka'), ('Begusarai', 'Begusarai'), ('Bhagalpur', 'Bhagalpur'), ('Bhoipur', 'Bhoipur'), ('Buxar', 'Buxar'), ('Darbhanga', 'Darbhanga'), ('East Champaran', 'East Champaran'), ('Gaya', 'Gaya'), ('Gopalganj', 'Gopalganj'), ('Jamui', 'Jamui'), ('Jehanabad', 'Jehanabad'), ('Kaimur (Bhabua)', 'Kaimur (Bhabua)'), ('Katihar', 'Katihar'), ('Khagaria', 'Khagaria'), ('Kishanganj', 'Kishanganj'), ('Lakhisaraj', 'Lakhisaraj'), ('Madhepura', 'Madhepura'), ('Madhubani', 'Madhubani'), ('Munger', 'Munger'), ('Muzaffarpur', 'Muzaffarpur'), ('Nalanda', 'Nalanda'), ('Nawada', 'Nawada'), ('Patna', 'Patna'), ('Purnia', 'Purnia'), ('Rohtas', 'Rohtas'), ('Saharsa', 'Saharsa'), ('Samastipur', 'Samastipur'), ('Saran', 'Saran'), 

                ('Sheikhpura', 'Sheikhpura'), ('Sheohar', 'Sheohar'), ('Sitamarhi', 'Sitamarhi'), ('Siwan', 'Siwan'), ('Supaull', 'Supaull'), ('Vaishali', 'Vaishali'), ('West Champaran', 'West Champaran'), ('Chandigarh', 'Chandigarh'), ('Ambikapur', 'Ambikapur'), ('Bastar', 'Bastar'), ('Bilaspur', 'Bilaspur'), ('Dantewada', 'Dantewada'), ('Dhamtari', 'Dhamtari'), ('Durg', 'Durg'), ('Janjgir Champa', 'Janjgir Champa'), ('Jashpur', 'Jashpur'), ('Kanker', 'Kanker'), ('Kawardha', 'Kawardha'), ('Korba', 'Korba'), ('Korea', 'Korea'), ('Mahasamund', 'Mahasamund'), ('Raigarh', 'Raigarh'), ('Raipur', 'Raipur'), ('Rajnandgaon', 'Rajnandgaon'), ('Surguja', 'Surguja'), ('Silvassa', 'Silvassa'), ('Daman', 'Daman'), ('Panaji', 'Panaji'), ('Ponda', 'Ponda'), ('Margao', 'Margao'), ('Canacona', 'Canacona'), ('Mapusa', 'Mapusa'), ('Vasco da Gama', 'Vasco da Gama'), ('Ahmedabad', 'Ahmedabad'), ('Amreli', 'Amreli'), ('Banas Kantha', 'Banas Kantha'), ('Bharuch', 'Bharuch'), ('Bhavnagar', 'Bhavnagar'), ('Dahod', 'Dahod'), ('Gandhinagar', 'Gandhinagar'), ('Junagadh', 'Junagadh'), ('Jamnagar', 'Jamnagar'), ('Kachchh', 'Kachchh'), ('Kheda', 'Kheda'), ('Mahesana', 'Mahesana'), ('Narmada', 'Narmada'), ('Navsari', 'Navsari'), ('Panch Mahals', 'Panch Mahals'), ('Patan', 'Patan'), ('Porbandar', 'Porbandar'), ('Rajkot', 'Rajkot'), ('Surendranagar', 'Surendranagar'), ('Sabar Kantha', 'Sabar Kantha'), ('Surat', 'Surat'), ('The Dangs', 'The Dangs'), ('Valsad', 'Valsad'), ('Vadodara', 'Vadodara'), ('Ankleshwar', 'Ankleshwar'), ('Vapi', 'Vapi'), ('Ambala', 'Ambala'), ('Bhiwani', 'Bhiwani'), ('Faridabad', 'Faridabad'), ('Fatehabad', 'Fatehabad'), ('Gurgaon', 'Gurgaon'), ('Hisar', 'Hisar'), ('Jhajjar', 'Jhajjar'), ('Jind', 'Jind'), ('Kaithal', 'Kaithal'), ('Karnal', 'Karnal'), ('Kurukshetra', 'Kurukshetra'), ('Mahendragarh', 'Mahendragarh'), ('Mewat', 'Mewat'), ('Panchkula', 'Panchkula'), ('Panipat', 'Panipat'), ('Rewari', 'Rewari'), ('Rohtak', 'Rohtak'), ('Sirsa', 'Sirsa'), ('Sonipat', 'Sonipat'), ('Yamunanagar', 'Yamunanagar'), ('Baddi', 'Baddi'), ('Ponta Sahib', 'Ponta Sahib'), ('Dharamshala', 'Dharamshala'), ('Anantnag', 'Anantnag'), ('Baramulla', 'Baramulla'), ('Budgam', 'Budgam'), ('Doda', 'Doda'), ('Jammu', 'Jammu'), ('Kargil', 'Kargil'), ('Kathua', 'Kathua'), ('Kupwara', 'Kupwara'), ('Leh', 'Leh'), ('Poonch', 'Poonch'), ('Pulwama', 'Pulwama'), ('Rajauri', 'Rajauri'), ('Srinagar', 'Srinagar'), ('Udhampur', 'Udhampur'), ('Bokaro', 'Bokaro'), ('Chatra', 'Chatra'), ('Dhanbad', 'Dhanbad'), ('Dumka', 'Dumka'), ('East Singhbhum', 'East Singhbhum'), ('Garhwa', 'Garhwa'), ('Giridih', 'Giridih'), ('Godda', 'Godda'), ('Gumla', 'Gumla'), ('Hazaribag', 'Hazaribag'), ('Jamtara', 'Jamtara'), ('Koderma', 'Koderma'), ('Latehar', 'Latehar'), ('Lohardaga', 'Lohardaga'), ('Pakur', 'Pakur'), ('Palamu', 'Palamu'), ('Ranchi', 'Ranchi'), ('Sahibganj', 'Sahibganj'), ('Seraikela', 'Seraikela'), ('Simdega', 'Simdega'), ('West Singhbhum', 'West Singhbhum'), ('Jamshedpur', 'Jamshedpur'), ('Bagalkot', 'Bagalkot'), ('Bangalore', 'Bangalore'), ('Bangalore Rural', 'Bangalore Rural'), ('Belgaum', 'Belgaum'), ('Bellary', 'Bellary'), ('Bidar', 'Bidar'), ('Bijapur', 'Bijapur'), ('Chamrajnagart', 'Chamrajnagart'), ('Chickmagalur', 'Chickmagalur'), ('Chitradurga', 'Chitradurga'), ('Davangere', 'Davangere'), ('Dharwad', 'Dharwad'), ('Gadag', 'Gadag'), ('Gulbarga', 'Gulbarga'), ('Ghazipur', 'Ghazipur'), ('Basti', 'Basti'), ('Hassan', 'Hassan'), ('Kodagu', 'Kodagu'), ('Kolar', 'Kolar'), ('Koppal', 'Koppal'), ('Mandya', 'Mandya'), ('Mysore', 'Mysore'), ('North Kannada', 'North Kannada'), ('Raichur', 'Raichur'), ('Shimoga', 'Shimoga'), ('South Kannada', 'South Kannada'), ('Tumkur', 'Tumkur'), ('Udupi', 'Udupi'), ('Hubli', 'Hubli'), ('Mangalore (Dakshina Kannada)', 'Mangalore (Dakshina Kannada)'), ('Alappuzha', 'Alappuzha'), ('Calicut', 'Calicut'), ('Cochin', 'Cochin'), ('Ernakulam', 'Ernakulam'), ('Idukki', 'Idukki'), ('Kannur', 'Kannur'), ('Kasargod', 'Kasargod'), ('Kollam', 'Kollam'), ('Kottayam', 'Kottayam'), ('Kozhikode', 'Kozhikode'), ('Malappuram', 'Malappuram'), ('Palakkad', 'Palakkad'), ('Pathanamthitta', 'Pathanamthitta'), ('Thiruvananthapuram', 'Thiruvananthapuram'), ('Thrissur', 'Thrissur'), ('Wayanad', 'Wayanad'), ('Thiruvalla', 'Thiruvalla'), ('Chalakudy', 'Chalakudy'), ('Chengannur', 'Chengannur'), ('Alawey', 'Alawey'), ('Kavaratti', 'Kavaratti'), ('Ahmednagar', 'Ahmednagar'), ('Akola', 'Akola'), ('Amravati', 'Amravati'), ('Aurangabad', 'Aurangabad'), ('Beed', 'Beed'), ('Bhandara', 'Bhandara'), ('Chandrapur', 'Chandrapur'), ('Dhule', 'Dhule'), ('Gadchiroli', 'Gadchiroli'), ('Gondia', 'Gondia'), ('Hingoli', 'Hingoli'), ('Jalgaon', 'Jalgaon'), ('Jalna', 'Jalna'), ('Kolhapur', 'Kolhapur'), ('Latur', 'Latur'), ('Mumbai City', 'Mumbai City'), ('Nagpur', 'Nagpur'), ('Nanded', 'Nanded'), ('Nandubar', 'Nandubar'), ('Nashik', 'Nashik'), ('Osmanabad', 'Osmanabad'), ('Parbhani', 'Parbhani'), ('Pune', 'Pune'), ('Rajgad', 'Rajgad'), ('Ratnagiri', 'Ratnagiri'), ('Sangli', 'Sangli'), ('Satara', 'Satara'), ('Sindhudurg', 'Sindhudurg'), 

                ('Solapur', 'Solapur'), ('Thane', 'Thane'), ('Wardha', 'Wardha'), ('Washim', 'Washim'), ('Yavatmal', 'Yavatmal'), ('Anuppur', 'Anuppur'), ('Ashoknagar', 'Ashoknagar'), ('Balaghat', 'Balaghat'), ('Barwani', 'Barwani'), ('Betul', 'Betul'), ('Bhind', 'Bhind'), ('Bhopal', 'Bhopal'), ('Burhanpur', 'Burhanpur'), ('Chhatarpur', 'Chhatarpur'), ('Chhindwara', 'Chhindwara'), ('Damoh', 'Damoh'), ('Datia', 'Datia'), ('Dewas', 'Dewas'), ('Dhar', 'Dhar'), ('Dindori', 'Dindori'), ('Guna', 'Guna'), ('Gwalior', 'Gwalior'), ('Harda', 'Harda'), ('Hoshangabad', 'Hoshangabad'), ('Indore', 'Indore'), ('itarsi', 'itarsi'), ('Jabalpur', 'Jabalpur'), ('Jhabua', 'Jhabua'), ('Katnir', 'Katnir'), ('Khandwa', 'Khandwa'), ('Khargone', 'Khargone'), ('Mandla', 'Mandla'), ('Mandsaur', 'Mandsaur'), ('Morena', 'Morena'), ('Raisen', 'Raisen'), ('Rajgarh', 'Rajgarh'), ('Ratlam', 'Ratlam'), ('Rewa', 'Rewa'), ('Sagar', 'Sagar'), ('Satna', 'Satna'), ('Sehore', 'Sehore'), ('Seoni', 'Seoni'), ('Shahdol', 'Shahdol'), ('Shajapur', 'Shajapur'), ('Sheopur', 'Sheopur'), ('Shivpuri', 'Shivpuri'), ('Sidhi', 'Sidhi'), ('Tikamgarh', 'Tikamgarh'), ('Ujjain', 'Ujjain'), ('Umaria', 'Umaria'), ('Vidisha', 'Vidisha'), ('Angul', 'Angul'), ('Balangir', 'Balangir'), ('Baleswar', 'Baleswar'), ('Bargarh', 'Bargarh'), ('Bhadrak', 'Bhadrak'), ('Bhubaneswar', 'Bhubaneswar'), ('Boudh', 'Boudh'), ('Cuttack', 'Cuttack'), ('Deogarh', 'Deogarh'), ('Dhenkanal', 'Dhenkanal'), ('Gajapati', 'Gajapati'), ('Ganjam', 'Ganjam'), ('Jagatsinghaur', 'Jagatsinghaur'), ('Jaipur', 'Jaipur'), ('Jharsuguda', 'Jharsuguda'), ('Kalahandi', 'Kalahandi'), ('Kandhamal', 'Kandhamal'), ('Kendrapara', 'Kendrapara'), ('Kendujharr', 'Kendujharr'), ('Khordha', 'Khordha'), ('Koraput', 'Koraput'), ('Malkangiri', 'Malkangiri'), ('Mayurbhanj', 'Mayurbhanj'), ('Nabarangapur', 'Nabarangapur'), ('Nayagarh', 'Nayagarh'), ('Nuapada', 'Nuapada'), ('Puri', 'Puri'), ('Rayagada', 'Rayagada'), ('Sambalpur', 'Sambalpur'), ('Subarnapur', 'Subarnapur'), ('Sundergarh', 'Sundergarh'), ('Sri Ganganagar', 'Sri Ganganagar'), ('Amritsar', 'Amritsar'), ('Bathinda', 'Bathinda'), ('Faridkot', 'Faridkot'), ('Fatehgarh Sahib', 'Fatehgarh Sahib'), ('Gurdaspur', 'Gurdaspur'), ('Jalandhar', 'Jalandhar'), ('Kapurthala', 'Kapurthala'), ('Ludhiana', 'Ludhiana'), ('Mansa', 'Mansa'), ('Ballia', 'Ballia'), ('Mohali', 'Mohali'), ('Muktsar', 'Muktsar'), ('Nawanshahr', 'Nawanshahr'), ('Patiala', 'Patiala'), ('Rupnagar', 'Rupnagar'), ('Sangrur', 'Sangrur'), ('Tarn Taran', 'Tarn Taran'), ('Pondicherry', 'Pondicherry'), ('Ajmer', 'Ajmer'), ('Alwar', 'Alwar'), ('Banswara', 'Banswara'), ('Baran', 'Baran'), ('Barmer', 

                'Barmer'), ('Bharatpur', 'Bharatpur'), ('Bhilwara', 'Bhilwara'), ('Bikaner', 'Bikaner'), ('Bundi', 'Bundi'), ('Chittorgarh', 'Chittorgarh'), ('Churu', 'Churu'), ('Dausa', 'Dausa'), ('Dholpur', 'Dholpur'), ('Dungarpur', 'Dungarpur'), ('Hanumangarh', 'Hanumangarh'), ('Jaipur', 'Jaipur'), ('Jaisalmer', 'Jaisalmer'), 

                ('Jalore', 'Jalore'), ('Jhalawar', 'Jhalawar'), ('Jhunjhunu', 'Jhunjhunu'), ('Jodhpur', 'Jodhpur'), ('Karauli', 'Karauli'), ('Kota', 'Kota'), ('Nagapur', 'Nagapur'), ('Pali', 'Pali'), ('Rajsamand', 'Rajsamand'), ('Sawai Madhopur', 'Sawai Madhopur'), ('Sikar', 'Sikar'), ('Sirohi', 'Sirohi'), ('Sri Ganganagar', 'Sri Ganganagar'), ('Tonk', 'Tonk'), ('Udaipur', 'Udaipur'), ('Chennai', 'Chennai'), ('Coimbatore', 'Coimbatore'), ('Cuddalore', 'Cuddalore'), ('Dharmapuri', 'Dharmapuri'), ('Dindigul', 'Dindigul'), ('Erode', 'Erode'), ('Kanchipuram', 'Kanchipuram'), ('Kanyakumari', 'Kanyakumari'), ('Karur', 'Karur'), ('Krishnagiri', 

                'Krishnagiri'), ('Madurai', 'Madurai'), ('Nagapattinam', 'Nagapattinam'), ('Namakkal', 'Namakkal'), ('Nilgiris', 'Nilgiris'), ('Perambalur', 'Perambalur'), ('Pudukkottai', 'Pudukkottai'), ('Ramanathapuram', 'Ramanathapuram'), ('Salem', 'Salem'), ('Sivaganga', 'Sivaganga'), ('Thanjayur', 'Thanjayur'), ('Theni', 'Theni'), ('Thoothukudi', 'Thoothukudi'), ('Tiruchirappalli', 'Tiruchirappalli'), ('Tirunelveli', 'Tirunelveli'), ('Tiruvallur', 'Tiruvallur'), ('Tiruvannamalai', 'Tiruvannamalai'), ('Tiruvarur', 'Tiruvarur'), ('Tirupatu', 'Tirupatu'), ('Vellore', 'Vellore'), ('Viluppuram', 'Viluppuram'), ('Virudhunagar', 'Virudhunagar'), ('Trichy', 'Trichy'), ('Aligarh', 'Aligarh'), ('Prayagraj', 'Prayagraj'), ('Ambedkar Nagar', 'Ambedkar Nagar'), ('Auraiya', 'Auraiya'), ('Azamgarh', 'Azamgarh'), ('Baghpat', 'Baghpat'), ('Bahraich', 'Bahraich'), ('Ballia', 'Ballia'), ('Balrampur', 'Balrampur'), ('Banda', 'Banda'), ('Barabanki', 'Barabanki'), ('Bareilly', 'Bareilly'), ('Basti', 'Basti'), ('Bijnor', 'Bijnor'), ('Budaun', 'Budaun'), ('Bulandshahar', 'Bulandshahar'), ('Chandauli', 'Chandauli'), ('Chitrakoot', 'Chitrakoot'), ('Deoria', 'Deoria'), ('Etah', 'Etah'), ('Etawah', 'Etawah'), ('Faizabad', 'Faizabad'), ('Farukkhabad', 'Farukkhabad'), ('Fatehpur', 'Fatehpur'), ('Firozabad', 'Firozabad'), ('Gautam Buddha Nagar', 'Gautam Buddha Nagar'), ('Ghazipur', 'Ghazipur'), ('Ghaziabad', 'Ghaziabad'), ('Gonda', 'Gonda'), ('Gorakhpur', 'Gorakhpur'), ('Hamirpur', 'Hamirpur'), ('Hardoi', 'Hardoi'), ('Hathras', 'Hathras'), ('Jalaun', 'Jalaun'), ('Jaunpur', 'Jaunpur'), ('Jhansi', 'Jhansi'), ('Jyotiba Phoole Nagar', 'Jyotiba Phoole Nagar'), ('Kannauj', 'Kannauj'), ('Kanpur Dehat', 'Kanpur Dehat'), ('Kanpur', 'Kanpur'), ('Kaushambi', 'Kaushambi'), ('Kushi Nagar', 'Kushi Nagar'), ('Lakhimpur', 'Lakhimpur'), ('Lakhimpur Kheri', 'Lakhimpur Kheri'), ('Lalitpur', 'Lalitpur'), ('Lucknow', 'Lucknow'), ('Maharajganj', 'Maharajganj'), ('Mahoba', 'Mahoba'), ('Mainpuri', 'Mainpuri'), ('Mathura', 'Mathura'), ('Mau', 'Mau'), ('Meerut', 'Meerut'), ('Mirzapur', 'Mirzapur'), ('Moradabad', 'Moradabad'), ('Muzaffar Nagar', 'Muzaffar Nagar'), ('Noida', 'Noida'), ('Pilibhit', 'Pilibhit'), ('Pratapgarh', 'Pratapgarh'), ('Raebareli', 'Raebareli'), ('Rampur', 'Rampur'), ('Saharanpur', 'Saharanpur'), ('Sant Kabir Nagar', 'Sant Kabir Nagar'), ('Sant Ravidas Nagar', 'Sant Ravidas Nagar'), ('Shahjahanpur', 'Shahjahanpur'), ('Shravasti', 'Shravasti'), ('Siddharth Nagar', 'Siddharth Nagar'), ('Sitapur', 'Sitapur'), ('Sonbhadra', 'Sonbhadra'), ('Sultanpur', 'Sultanpur'), ('Unnao', 'Unnao'), ('Varanasi', 'Varanasi'), ('gkp', 'gkp'), ('Almora', 'Almora'), ('Bageshwar', 'Bageshwar'), ('Champawat', 'Champawat'), ('Chamoli', 'Chamoli'), ('Dehradun', 'Dehradun'), ('Haridwar', 'Haridwar'), ('Nainital', 'Nainital'), ('Pauri', 'Pauri'), ('Pithoragarh', 'Pithoragarh'), ('Roorkee', 'Roorkee'), ('Rudraprayag', 'Rudraprayag'), ('Tehri', 'Tehri'), ('Udham Singh Nagar', 'Udham Singh Nagar'), ('Uttarkashi', 'Uttarkashi'), ('Bankura', 'Bankura'), ('Bardhaman', 'Bardhaman'), ('Birbhum', 'Birbhum'), ('Cooch Behar', 'Cooch Behar'), ('Darjeeling', 'Darjeeling'), ('East Medinipur', 'East Medinipur'), ('Hooghly', 'Hooghly'), ('Howrah', 'Howrah'), ('Jalpaiguri', 'Jalpaiguri'), ('Kolkata', 'Kolkata'), ('Malda', 'Malda'), ('Murshidabad', 'Murshidabad'), ('Nadia', 'Nadia'),

                ('North 24 Parganas', 'North 24 Parganas'), ('North Dinajpur', 'North Dinajpur'), ('Purulia', 'Purulia'), ('Siliguri', 'Siliguri'), ('South 24 Parganas', 'South 24 Parganas'), ('Jamshedpur', 'Jamshedpur'), ('West Medinipur', 'West Medinipur'), ('Kangra', 'Kangra'), ('parwanoo', 'parwanoo'), ('Sirmour', 'Sirmour'), ('Una', 'Una'), ('Mandi', 'Mandi'), ('bilaspur', 'bilaspur'), ('Kala Amb', 'Kala Amb'), ('Bahadurgarh', 'Bahadurgarh'), ('Solan', 'Solan'), ('Kashipur', 'Kashipur'), ('Nalagarh', 'Nalagarh'), ('Secunderabad', 'Secunderabad'), ('Zirakpur', 'Zirakpur'), ('Bahadurgarh', 'Bahadurgarh'), ('Sansarpur Terrace', 'Sansarpur Terrace'), ('Himatnagar', 'Himatnagar'), ('anand', 'anand'), ('Nadiad', 'Nadiad'), ('Sirmour', 'Sirmour'), ('Shimla', 'Shimla'), ('PHILLAUR', 'PHILLAUR'), ('Tirupur', 'Tirupur'), ('Manakpur', 'Manakpur'), ('Rudrapur', 'Rudrapur'), ('Rudrapur', 'Rudrapur'), ('Pithampur', 'Pithampur'), ('Pithampur', 'Pithampur'), ('Pithampur', 'Pithampur'), ('Gandhi nagar', 'Gandhi nagar'), ('Hosur', 'Hosur'), ('Hosur', 'Hosur'), ('Chicalim', 'Chicalim'), ('Palghar', 'Palghar'), ('Mavelikara', 'Mavelikara'), ('Raipur', 'Raipur'), ('Trichur', 'Trichur'), ('Bhiwadi', 'Bhiwadi'), ('Verna', 'Verna'), ('Wadhwan', 'Wadhwan'), ('paonta shib', 'paonta shib'), ('Vallur', 'Vallur'), ('Valasan', 'Valasan'), ('Goregaon', 'Goregaon'), ('Changodar', 'Changodar'), ('Jalgaon', 'Jalgaon'), ('Mandal', 'Mandal'), ('Kolenchery', 'Kolenchery'), ('Tanuku', 'Tanuku'), ('Mapusa', 'Mapusa'), ('Bicholim', 'Bicholim'), ('Bicholim', 'Bicholim'), ('Kundaim', 'Kundaim'), ('Bardez', 'Bardez'), ('Godhra', 'Godhra'), ('Visnanagar', 'Visnanagar'), ('Dakor', 'Dakor'), ('Nandesari', 'Nandesari'), ('Rajpipla', 'Rajpipla'), ('Sohna', 'Sohna'), ('Kundli', 'Kundli'), ('Kundli', 'Kundli'), ('Bhatkal', 'Bhatkal'), ('Alwaye', 'Alwaye'), ('Kashragod', 'Kashragod'), ('Kanhangad', 'Kanhangad'), ('Kanhangad', 

                'Kanhangad'), ('Kanhangad', 'Kanhangad'), ('Tiruvallur', 'Tiruvallur'), ('Muvattupuzha', 'Muvattupuzha'), ('Kochi', 'Kochi'), ('Shoranur', 'Shoranur'), ('Malappuram', 'Malappuram'), ('Mandsaur', 'Mandsaur'), ('Boisar', 'Boisar'), ('Waluj', 'Waluj'), ('Taloja', 'Taloja'), ('Kolhapur', 'Kolhapur'), ('Navi Mumbai', 'Navi Mumbai'), ('Magurgadia', 'Magurgadia'), ('Phagwara', 'Phagwara'), ('Dagru', 'Dagru'), ('Bengaluru', 

                'Bengaluru'), ('Virar', 'Virar'), ('Khanna', 'Khanna'), ('Shahganj', 'Shahganj'), ('Siddhpur', 'Siddhpur'), ('Thayamkulangara', 'Thayamkulangara'), ('Hoshiarpur', 'Hoshiarpur'), ('New Delhi', 'New Delhi'), ('Pathankot', 'Pathankot'), ('Haldwani', 'Haldwani'), ('Moga', 'Moga'), ('Ferozepur', 'Ferozepur'), ('Fazilka', 'Fazilka'), ('Barnala', 'Barnala'), ('Malerkotla', 'Malerkotla'), ('SBS Nagar', 'SBS Nagar'), ('Charkhi Dadri', 'Charkhi Dadri'), ('-', '-'), ('Rishikesh', 'Rishikesh'), ('Amethi', 'Amethi'), ('Nuh', 'Nuh'), ('Deoghar', 'Deoghar'), ('Sambhal', 'Sambhal'), ('Nagaur', 'Nagaur'), ('Ramgarh', 'Ramgarh')]

                            ),

            'special_mentions': forms.Textarea(attrs={'class': 'form-control', 'rows': 4, 'cols': 40}),

        }





class UserMenuMappingForm(forms.ModelForm):

    pass

    user_id = forms.ModelChoiceField(

        queryset=CustomUser.objects.all(),

        widget=forms.RadioSelect(attrs={'onchange':'user_changed(this)'}),

        label="Select User"

    )



    menu_id = forms.ModelMultipleChoiceField(

        queryset=MenuItem.objects.all(),

        widget=forms.CheckboxSelectMultiple,

        label="Select Menu Items"

    )



    class Meta:

        model = UserMenuMapping

        fields = ['user_id', 'menu_id', ]