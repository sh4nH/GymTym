from django.db import models

class USCTraffic(models.Model):
    hour = models.IntegerField(primary_key=  True)
    mon = models.PositiveIntegerField(null = True, default = 0)
    tue = models.PositiveIntegerField(null = True, default = 0)
    wed = models.PositiveIntegerField(null= True, default = 0)
    thu = models.PositiveIntegerField(null = True, default = 0)
    fri = models.PositiveIntegerField(null = True, default = 0)
    sat = models.PositiveIntegerField(null = True, default = 0)
    sun = models.PositiveIntegerField(null =  True, default = 0)

class UTTraffic(models.Model):
    hour = models.IntegerField(primary_key=  True)
    mon = models.PositiveIntegerField(null =  True, default = 0)
    tue = models.PositiveIntegerField(null =  True, default = 0)
    wed = models.PositiveIntegerField(null =  True, default = 0)
    thu = models.PositiveIntegerField(null =  True, default = 0)
    fri = models.PositiveIntegerField(null =  True, default = 0)
    sat = models.PositiveIntegerField(null =  True, default = 0)
    sun = models.PositiveIntegerField(null =  True, default = 0)

class MPSHTraffic(models.Model):
    hour = models.IntegerField(primary_key=  True)
    mon = models.PositiveIntegerField(null =  True, default = 0)
    tue = models.PositiveIntegerField(null =  True, default = 0)
    wed = models.PositiveIntegerField(null =  True, default = 0)
    thu = models.PositiveIntegerField(null =  True, default = 0)
    fri = models.PositiveIntegerField(null =  True, default = 0)
    sat = models.PositiveIntegerField(null =  True, default = 0)
    sun = models.PositiveIntegerField(null =  True, default = 0)

class WellnessTraffic(models.Model):
    hour = models.IntegerField(primary_key=  True)
    mon = models.PositiveIntegerField(null =  True, default = 0)
    tue = models.PositiveIntegerField(null =  True, default = 0)
    wed = models.PositiveIntegerField(null =  True, default = 0)
    thu = models.PositiveIntegerField(null =  True, default = 0)
    fri = models.PositiveIntegerField(null =  True, default = 0)
    sat = models.PositiveIntegerField(null =  True, default = 0)
    sun = models.PositiveIntegerField(null =  True, default = 0)

class NumberOfReadings(models.Model):
    hour = models.IntegerField(primary_key=  True)
    mon = models.PositiveIntegerField(null =  True, default = 0)
    tue = models.PositiveIntegerField(null =  True, default = 0)
    wed = models.PositiveIntegerField(null =  True, default = 0)
    thu = models.PositiveIntegerField(null =  True, default = 0)
    fri = models.PositiveIntegerField(null =  True, default = 0)
    sat = models.PositiveIntegerField(null =  True, default = 0)
    sun = models.PositiveIntegerField(null =  True, default = 0)