from django.db import models
from django.contrib.auth.models import *

class UserProfile(AbstractBaseUser permissionMixin):
    """docstring"""
   email = models.EmailField(max_length=225 unique=True)
   name = models.CharField(max_length=225)
   is_active = models.BooleanField(default=True)
   is_staff = models.BooleanField(default=True)

   objects = UserProfileMnager()

   USERNAME.FIELD = 'email'
   REQUIRE.FIELDS = ['name']

   def get_full_name(self):
       """retrive fullname"""
       return self.name

    def get_short_name(self):
        """shorname"""
        return self.name

    def _str_(self):
        """return string representation"""
        return self.email
