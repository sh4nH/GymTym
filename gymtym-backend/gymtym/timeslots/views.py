from django.shortcuts import render
from .models import *
from django.http import HttpRequest, HttpResponse
import pandas as pd
import math
import json

# Helper Functions
def tuple_parser(tup_list):
    json_array = []
    for rank in range(1, len(tup_list) + 1):
        json_dict = {}
        json_dict["rank"] = rank
        json_dict["start"] = (tup_list[rank - 1])[0]
        json_dict["end"] = json_dict["start"] + 1
        json_dict["day"] = (tup_list[rank - 1])[1]
        json_obj = json.dumps(json_dict)
        json_array.append(json_obj)
    return json_array

# HTTP Response 
def to_df(request: HttpRequest):
    ut = pd.DataFrame(list(UTTraffic.objects.all().values()))
    reads = pd.DataFrame(list(NumberOfReadings.objects.all().values()))
    ut.set_index('hour', inplace= True)
    reads.set_index('hour', inplace= True)
    days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
    avg_traffic_dict = {}
    for day in days:
        for h in range(7, 22):
            avg_traffic = math.floor(ut.loc[h, day] / reads.loc[h, day]) if reads.loc[h, day] != 0 else 0
            if avg_traffic in avg_traffic_dict:
                avg_traffic_dict[avg_traffic].append(tuple([h, day]))
            else:
                avg_traffic_dict[avg_traffic] = []
                avg_traffic_dict[avg_traffic].append(tuple([h, day]))
    traffics = list(avg_traffic_dict.keys())
    traffics.sort()
    timeslot_list = []
    for traffic in traffics:
        if(traffic != 0):
            timeslot_list += avg_traffic_dict[traffic]
    return HttpResponse(tuple_parser(timeslot_list))
    
    



