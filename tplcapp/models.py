from django.contrib.auth.models import AbstractBaseUser, BaseUserManager,PermissionsMixin
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils.timezone import now  # Import Django's timezone utility
import hashlib
import random
import string
from django.core.exceptions import ValidationError


class CustomUserManager(BaseUserManager):
    def create_user(self, email, name, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, name=name, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, name, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self.create_user(email, name, password, **extra_fields)

class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    last_login = models.DateTimeField(null=True, blank=True)
    address    = models.TextField(null=False)
    area        = models.CharField( max_length=150)
    created_at = models.DateTimeField(default=now)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name']

    class Meta:
        db_table = 'tbl_user'


    def __str__(self):
        return self.email


def doctor_registration_registration_certificate(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'doctor/registration_certificate/registration_certificate{instance.id}{random_string}.{extension}'
def doctor_registration_selfie(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'doctor/selfie/selfie{instance.id}{random_string}.{extension}'
def doctor_registration_signature(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'doctor/signature/signature{instance.id}{random_string}.{extension}'
class DoctorRegistration(models.Model):
    doctor_name = models.CharField(max_length=255)
    house_no = models.CharField(max_length=255, )
    street = models.CharField(max_length=255, )
    district = models.CharField(max_length=255, )
    state = models.CharField(max_length=255, )
    pin_code = models.IntegerField()
    hospital_house_no = models.CharField(max_length=255)
    hospital_street = models.CharField(max_length=255, )
    hospital_district = models.CharField(max_length=255, )
    hospital_state = models.CharField(max_length=255, )
    hospital_pin_code = models.IntegerField()
    mobile_number = models.CharField(max_length=10)
    alternate_mobile_number = models.CharField(max_length=10, blank=True, null=True)
    email = models.EmailField()
    dob = models.DateField()
    wedding_date = models.DateField(blank=True, null=True)
    id_proof = models.CharField(max_length=50, )
    id_number = models.CharField(max_length=255)
    speciality = models.CharField(max_length=50, )
    other_speciality = models.CharField(max_length=255,)
    qualification = models.CharField(max_length=255)
    registration_number = models.CharField(max_length=255)
    registration_year = models.IntegerField()
    medical_council = models.CharField(max_length=255)
    visiting_physician = models.CharField(max_length=3, )
    associated_hospitals = models.TextField()
    legal_claims = models.CharField(max_length=255,blank=True, null=True )
    practice_duration = models.IntegerField(blank=True, null=True)
    avg_patients_per_day = models.CharField(max_length=255,blank=True, null=True)
    unqualified_staff_extension = models.CharField(max_length=3, )
    annual_income = models.IntegerField(blank=True, null=True)
    insurance_cover = models.CharField(max_length=10, )
    coverage_amount     = models.CharField(max_length=100)
    # ref_doctor_1_name = models.CharField(max_length=255, blank=True, null=True)
    # ref_doctor_1_contact = models.CharField(max_length=10, blank=True, null=True)
    # ref_doctor_1_location = models.CharField(max_length=255, blank=True, null=True)
    # ref_doctor_2_name = models.CharField(max_length=255, blank=True, null=True)
    # ref_doctor_2_contact = models.CharField(max_length=10, blank=True, null=True)
    # ref_doctor_2_location = models.CharField(max_length=255, blank=True, null=True)
    tenure_of_membership = models.CharField(max_length=255)
    tenure_of_indemnity = models.CharField(max_length=255)
    tplc_rep_name = models.CharField(max_length=255)
    tplc_rep_email = models.EmailField()
    total_amount_paid = models.IntegerField()
    payment_details = models.CharField(max_length=255,)
    registration_certificate = models.FileField(upload_to=doctor_registration_registration_certificate, blank=True, null=True)
    selfie = models.ImageField(upload_to=doctor_registration_selfie, blank=True, null=True)
    signature = models.ImageField(upload_to=doctor_registration_signature, blank=True, null=True)
    submission_date_time = models.DateTimeField()
    place_of_submission = models.CharField(max_length=100)
    app_registraction_no = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    user_id= models.BigIntegerField()
    def __str__(self):
        return self.doctor_name

    class Meta:
        db_table ="tbl_doctor_registration"  




def hos_nurg_registration_certificate(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'hospital_and_nursing_home/registration_certificate/registration_certificate{instance.id}{random_string}.{extension}'
def hos_nurg_selfie(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'hospital_and_nursing_home/selfie/selfie{instance.id}{random_string}.{extension}'
def hos_nurg_signature(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'hospital_and_nursing_home/signature/signature{instance.id}{random_string}.{extension}'

class HospitalAndNursingHomeRegistration(models.Model):
    hospital_name = models.CharField(max_length=255)
    proprietor_name = models.CharField(max_length=255)
    # residence_address = models.CharField(max_length=255)
    house_no = models.CharField(max_length=255, )
    street = models.CharField(max_length=255, )
    district = models.CharField(max_length=255, )
    state = models.CharField(max_length=255, )
    pin_code = models.IntegerField( )
    hospital_address = models.CharField(max_length=255, )
    hospital_house_no = models.CharField(max_length=255, )
    hospital_street = models.CharField(max_length=255, )
    hospital_district = models.CharField(max_length=255, )
    hospital_state = models.CharField(max_length=255, )
    hospital_pin_code = models.IntegerField( )
    mobile_number = models.CharField(max_length=10)
    alternate_mobile_number = models.CharField(max_length=10,null=True, blank=True )
    email = models.EmailField()
    dob = models.DateField()
    wedding_date = models.DateField( max_length=10,null=True, blank=True )
    id_proof = models.CharField(max_length=255)
    id_number = models.CharField(max_length=255)
    registration_number_hospital = models.CharField(max_length=255,)
    registration_year = models.IntegerField()
    no_of_beds = models.IntegerField()
    annual_opd = models.IntegerField()
    annual_ipd = models.IntegerField()
    facilities_available = models.CharField(max_length=255)
    total_doctors = models.IntegerField()
    insurance_cover = models.CharField(max_length=255)
    coverage_amount = models.CharField(max_length=255)
    # ref_doctor_1_name = models.CharField(max_length=255, blank=True)
    # ref_doctor_1_contact = models.CharField(max_length=10, blank=True)
    # ref_doctor_1_location = models.CharField(max_length=255, blank=True)
    # ref_doctor_2_name = models.CharField(max_length=255, blank=True)
    # ref_doctor_2_contact = models.CharField(max_length=10, blank=True)
    # ref_doctor_2_location = models.CharField(max_length=255, blank=True)
    tenure_of_membership = models.CharField(max_length=255)
    tenure_of_indemnity = models.CharField(max_length=255)
    tplc_rep_name = models.CharField(max_length=255)
    tplc_rep_email = models.EmailField()
    total_amount_paid = models.IntegerField()
    payment_details = models.CharField(max_length=255, )
    registration_certificate = models.FileField(upload_to=hos_nurg_registration_certificate, null=True, blank=True)
    selfie = models.ImageField(upload_to=hos_nurg_selfie, null=True, blank=True)
    signature = models.ImageField(upload_to=hos_nurg_signature, null=True, blank=True)
    submission_date_time = models.DateTimeField()
    place_of_submission = models.CharField(max_length=100,)
    app_registraction_no = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    user_id= models.BigIntegerField()
    class Meta:
        db_table ="tbl_hospital_registration"  


def diagnostic_center_registration_certificate(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'diagnostic_center/registration_certificate/registration_certificate{instance.id}{random_string}.{extension}'
def diagnostic_center_selfie(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'diagnostic_center/selfie/selfie{instance.id}{random_string}.{extension}'
def diagnostic_center_signature(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'diagnostic_center/signature/signature{instance.id}{random_string}.{extension}'
class DiagnosticCentreRegistration(models.Model):
    hospital_name = models.CharField(max_length=255)
    proprietor_name = models.CharField(max_length=255)
    # residence_address = models.CharField(max_length=255)
    house_no = models.CharField(max_length=255, )
    street = models.CharField(max_length=255, )
    district = models.CharField(max_length=255, )
    state = models.CharField(max_length=255, )
    pin_code = models.IntegerField( )
    hospital_address = models.CharField(max_length=255, )
    hospital_house_no = models.CharField(max_length=255, )
    hospital_street = models.CharField(max_length=255,)
    hospital_district = models.CharField(max_length=255, )
    hospital_state = models.CharField(max_length=255, )
    hospital_pin_code = models.IntegerField()
    mobile_number = models.CharField(max_length=10)
    alternate_mobile_number = models.CharField(max_length=10, blank=True)
    email = models.EmailField()
    dob = models.DateField()
    wedding_date = models.DateField(blank=True, null=True)
    id_proof = models.CharField(max_length=50)
    id_number = models.CharField(max_length=255)
    registration_number_hospital = models.CharField(max_length=255, )
    registration_year = models.IntegerField()
    annual_opd = models.IntegerField()
    facilities_available = models.CharField(max_length=255)
    total_doctors = models.IntegerField()
    insurance_cover = models.CharField(max_length=50)
    coverage_amount     = models.CharField(max_length=100)
    # ref_doctor_1_name = models.CharField(max_length=255, blank=True)
    # ref_doctor_1_contact = models.CharField(max_length=10, blank=True)
    # ref_doctor_1_location = models.CharField(max_length=255, blank=True)
    # ref_doctor_2_name = models.CharField(max_length=255, blank=True)
    # ref_doctor_2_contact = models.CharField(max_length=10, blank=True)
    # ref_doctor_2_location = models.CharField(max_length=255, blank=True)
    tenure_of_membership = models.CharField(max_length=255)
    tenure_of_indemnity = models.CharField(max_length=255)
    tplc_rep_name = models.CharField(max_length=255)
    tplc_rep_email = models.EmailField()
    total_amount_paid = models.IntegerField()
    payment_details = models.CharField(max_length=255, )
    registration_certificate = models.FileField(upload_to=diagnostic_center_registration_certificate, blank=True)
    selfie = models.ImageField(upload_to=diagnostic_center_selfie, blank=True)
    signature = models.ImageField(upload_to=diagnostic_center_signature, blank=True)
    submission_date_time = models.DateTimeField()
    place_of_submission = models.CharField(max_length=100, )
    app_registraction_no = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    user_id= models.BigIntegerField()
    def __str__(self):
        return self.hospital_name

    class Meta:
        db_table ="tbl_diagnostic_center_reg"  


def payment_selfie(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'payment/selfie/selfie{instance.id}{random_string}.{extension}'
def payment_signature(instance, filename):
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    extension = filename.split('.')[-1]
    return f'payment/document/document{instance.id}{random_string}.{extension}'
class PaymentFormsDtailsModel(models.Model):
    paymentID = models.CharField(max_length=20, )
    # Basic information
    member_reg_no=  models.CharField(max_length=100, )
    # member_status = models.CharField(max_length=255)
    insured_type = models.CharField(max_length=100, )
    # member_type = models.CharField(max_length=100,)
    doctor_nameor_establised = models.CharField(max_length=255,null=True)

    proprietor_name = models.CharField(max_length=255,)

    
    # insured_name = models.CharField(max_length=255)
    speciality = models.CharField(max_length=100)

    # Address fields
    house_no = models.CharField(max_length=100)
    street = models.CharField(max_length=255)
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    pincode = models.CharField(max_length=10)

    # Contact fields
    mobile1 = models.CharField(max_length=15)
    mobile2 = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField()

    # Plan and payment
    plan = models.CharField(max_length=100,)
    membership_tenure = models.CharField(max_length=100,)
    indemnity_amount  = models.CharField(max_length=100,)
    indemnity_tenure  = models.CharField(max_length=100,)
    plan = models.CharField(max_length=100,)
    plan = models.CharField(max_length=100,)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)

    # KYC
    customer_id_type = models.CharField(max_length=100, )
    customer_id_number = models.CharField(max_length=100)

    # # Payment details
    payment_type = models.CharField(max_length=100, )
    additional_member_id = models.CharField(max_length=100)
    # transaction_date = models.DateField()
    # transaction_ref_no = models.CharField(max_length=100)
    # transaction_amount = models.DecimalField(max_digits=10, decimal_places=2)
    # bank_name = models.CharField(max_length=255)

    # File uploads
    selfie = models.ImageField(upload_to=payment_selfie, blank=True, null=True)
    document = models.FileField(upload_to=payment_signature, blank=True, null=True)

    # Additional fields
    remarks = models.TextField(blank=True, null=True)
    place_of_submission = models.CharField(max_length=255, )
    payment_date = models.DateField()
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    user_id= models.BigIntegerField()
    def __str__(self): 
        return self.doctor_name
    class Meta:
        db_table ="tbl_payment_form_details"  

    
class PaymentTableMultiRowModel(models.Model):
    # Payment details
    payment_forms_dtails = models.ForeignKey("PaymentFormsDtailsModel",  on_delete=models.CASCADE)
    payment_mode = models.CharField(max_length=100, )
    additional_member_id = models.CharField(max_length=100)
    transaction_date = models.DateField()
    transaction_ref_no = models.CharField(max_length=100)
    transaction_amount = models.DecimalField(max_digits=10, decimal_places=2)
    bank_name = models.CharField(max_length=255)
    payment_tabl_type = models.CharField(max_length=100, )

    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    class Meta:
        db_table ="tbl_payment_multi_row_details"  


# class User(models.Model):
#     email = models.EmailField( max_length=254)
#     password= models.CharField( max_length=50)
#     created_at = models.DateTimeField(default=now)
#     name=  models.EmailField( max_length=254)
#     class Meta:
#         db_table ="tbl_user"  



from django.db import models

class LeadModel(models.Model):
    # Lead date
    lead_date = models.DateField()

    member_type = models.CharField(max_length=20, )
    doctor_name = models.CharField(max_length=255)
    hospital_name = models.CharField(max_length=255)
    diagnostic_name = models.CharField(max_length=255)
    contact_person = models.CharField(max_length=255)
    category = models.CharField(max_length=100, blank=True, null=True)
    mobile = models.CharField(max_length=15)
    mobile2 = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField()

    # # Member Status
    # STATUS_CHOICES = [
    #     ('active', 'Active'),
    #     ('inactive', 'Inactive'),
    #     ('pending', 'Pending'),
    # ]
    # member_status = models.CharField(max_length=20, choices=STATUS_CHOICES)

    # Landline
    # landline = models.CharField(max_length=15, blank=True, null=True)

    # Address Fields
    # address1 = models.CharField(max_length=255)
    # address2 = models.CharField(max_length=255, blank=True, null=True)

    # Location Fields
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100)

    # Employee Information (Optional)
    employee = models.CharField(max_length=255, blank=True, null=True)

    # Remarks (Optional)
    remarks = models.TextField(blank=True, null=True)
    # def __str__(self):
    #     return f"Lead for {self.doctor_name} ({self.member_type})"
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    user_id= models.BigIntegerField()
    class Meta:
        # verbose_name = 'Lead'
        # verbose_name_plural = 'Leads'
        db_table="tbl_leads"

from django.db import models

class PolicyDetailsModel(models.Model):
    POLICY_TYPE_CHOICES = [
        ('Health', 'Health Insurance'),
        ('Life', 'Life Insurance'),
        ('Auto', 'Auto Insurance'),
        ('Property', 'Property Insurance'),
        # Add more types as needed
    ]

    policy_type = models.CharField(max_length=50,choices=POLICY_TYPE_CHOICES,verbose_name="Policy Type")
    expiry_date = models.DateField(verbose_name="Expiry Date")
    insurer_name = models.CharField(max_length=255,verbose_name="Insurer / Company Name")

    def __str__(self):
        return f"{self.policy_type} - {self.insurer_name}"

    class Meta:
        # verbose_name = "Policy"
        # verbose_name_plural = "Policies"
        db_table ="tbl_policy_details"


class AppointmentModel(models.Model):
    appointment_date = models.DateField(verbose_name="Appointment Date")
    employee_sales = models.CharField(max_length=255, verbose_name="Employee Sales")
    from_time = models.TimeField(verbose_name="From Time")
    to_time = models.TimeField(verbose_name="To Time")

    def __str__(self):
        return f"{self.appointment_date} - {self.employee_sales}"

    def clean(self):
        # Custom validation to ensure `from_time` is before `to_time`
        if self.from_time >= self.to_time:
            raise ValidationError({"to_time": "To Time must be after From Time."})
    
    class Meta:
        db_table ="tbl_appointment"

        


# class ProposalDetailsModel(models.Model):
#     name =models.CharField( max_length=50)
#     email = models.EmailField( max_length=254)
#     mobile_no = models.CharField( max_length=10)
#     created_at = models.DateTimeField(default=now)  # Default to current time
#     updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
#     status = models.IntegerField(default=1)

#     class Meta:
#         db_table ="tbl_proposal_details"



class ProposalExtraDetailsModel(models.Model):
    member_type = models.CharField(max_length=50, )
    member_name = models.CharField(max_length=255)
    hospital_name = models.CharField(max_length=255)
    specialization = models.CharField(max_length=255)
    mobile = models.CharField(max_length=15)
    city = models.CharField(max_length=100)
    proposal_no  = models.CharField(max_length=15)
    special_mentions = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    user_id= models.BigIntegerField()
    def __str__(self):
        return self.member_name

    class Meta:
        db_table ="tbl_proposal_extra_details"

class ProposalMultiRecordsModel(models.Model):
    proposal_details = models.ForeignKey("ProposalExtraDetailsModel",  on_delete=models.CASCADE)
    services_type = models.CharField(max_length=50,  )
    cover = models.CharField(max_length=50, )
    premium_amount = models.DecimalField(max_digits=10, decimal_places=2, )
    membership_amount = models.DecimalField(max_digits=10, decimal_places=2, )
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, )
    membership_tenure = models.CharField(max_length=50, )
    policy_tenure = models.CharField(max_length=50, )
    created_at = models.DateTimeField(default=now)  # Default to current time
    updated_at = models.DateTimeField(auto_now=True)  # Automatically update on save
    status = models.IntegerField(default=1)
    class Meta:
        db_table ="tbl_proposal_multi_record"




class MenuItem(models.Model):
    title = models.CharField(max_length=255)
    icon = models.CharField(max_length=255, blank=True, null=True)
    url = models.CharField(max_length=255, blank=True, null=True)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')
    order = models.PositiveIntegerField(default=0)
    status= models.IntegerField(default=1)
    class Meta:
        db_table ="tbl_menu_item"
        ordering = ['order']

    def __str__(self):
        return self.title

    def to_dict(self):
        """ Convert menu item to dictionary format """
        submenu = [child.to_dict() for child in self.children.all()]
        menu_dict = {
            "title": self.title,
            "icon": self.icon,
        }
        if self.url:
            menu_dict["url"] = self.url
        if submenu:
            menu_dict["submenu"] = submenu
        return menu_dict


class UserMenuMapping(models.Model):
    id          = models.BigAutoField(primary_key=True)
    user_id        = models.BigIntegerField()#models.ForeignKey(CustomUser, verbose_name=_("User"), on_delete=models.CASCADE)
    menu_id        = models.BigIntegerField()#models.ForeignKey(MenuItem, verbose_name=_("Menu Item"), on_delete=models.CASCADE)
    status      = models.SmallIntegerField(default=1)  # Active = 1, Inactive = 0
    created_at  = models.DateTimeField(default=now)  # Default to current time
    updated_at  = models.DateTimeField(auto_now=True)  # Auto-update on modification

    class Meta:
        db_table = "tbl_user_menu_mapping"
        verbose_name = "User Menu Mapping"
        verbose_name_plural = "User Menu Mappings"
        unique_together = ("user", "menu")  # Ensure a user can't have duplicate menu mappings
        unique_together = ("user_id", "menu_id")  # Ensure a user can't have duplicate menu mappings

    def __str__(self):
        return f"{self.user} -> {self.menu}"