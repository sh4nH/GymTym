from bs4 import BeautifulSoup
import urllib.request
import pandas as pd
import mysql.connector
from mysql.connector import cursor
from datetime import *
import calendar

# Helper Functions

def add_readings(day, hour):
    connector = mysql.connector.connect(
        host = 'gymtymdata.cxfo6fbgj0yb.us-west-2.rds.amazonaws.com', 
        user = 'gymtymteam', 
        password = 'jim2gether'
    )
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    cursor.execute("select {day} from timeslots_numberofreadings where hour = {hour}".format(day = day, hour = hour))
    reading = 0
    for x in cursor:
        for y in x:
            reading = y
    reading += 1
    cursor.close()
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    update_cmd = "update timeslots_numberofreadings set {day} = {reading} where hour = {hour}".format(day = day, reading = reading, hour = hour)
    cursor.execute(update_cmd)
    connector.commit()
    cursor.close()

def add_utown(day, hour, traffic):
    connector = mysql.connector.connect(
        host = 'gymtymdata.cxfo6fbgj0yb.us-west-2.rds.amazonaws.com', 
        user = 'gymtymteam', 
        password = 'jim2gether'
    )
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    cursor.execute("select {day} from timeslots_uttraffic where hour = {hour}".format(day = day, hour = hour))
    reading = 0
    for x in cursor:
        for y in x:
            reading = y
    reading += traffic[2]
    cursor.close()
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    update_cmd = "update timeslots_uttraffic set {day} = {reading} where hour = {hour}".format(day = day, reading = reading, hour = hour)
    cursor.execute(update_cmd)
    connector.commit()
    cursor.close()

def add_usc(day, hour, traffic):
    connector = mysql.connector.connect(
        host = 'gymtymdata.cxfo6fbgj0yb.us-west-2.rds.amazonaws.com', 
        user = 'gymtymteam', 
        password = 'jim2gether'
    )
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    cursor.execute("select {day} from timeslots_usctraffic where hour = {hour}".format(day = day, hour = hour))
    reading = 0
    for x in cursor:
        for y in x:
            reading = y
    reading += traffic[1]
    cursor.close()
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    update_cmd = "update timeslots_usctraffic set {day} = {reading} where hour = {hour}".format(day = day, reading = reading, hour = hour)
    cursor.execute(update_cmd)
    connector.commit()
    cursor.close()

def add_mpsh(day, hour, traffic):
    connector = mysql.connector.connect(
        host = 'gymtymdata.cxfo6fbgj0yb.us-west-2.rds.amazonaws.com', 
        user = 'gymtymteam', 
        password = 'jim2gether'
    )
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    cursor.execute("select {day} from timeslots_mpshtraffic where hour = {hour}".format(day = day, hour = hour))
    reading = 0
    for x in cursor:
        for y in x:
            reading = y
    reading += traffic[0]
    cursor.close()
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    update_cmd = "update timeslots_mpshtraffic set {day} = {reading} where hour = {hour}".format(day = day, reading = 0, hour = hour)
    cursor.execute(update_cmd)
    connector.commit()
    cursor.close()

def add_wellness(day, hour, traffic):
    connector = mysql.connector.connect(
        host = 'gymtymdata.cxfo6fbgj0yb.us-west-2.rds.amazonaws.com', 
        user = 'gymtymteam', 
        password = 'jim2gether'
    )
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    cursor.execute("select {day} from timeslots_wellnesstraffic where hour = {hour}".format(day = day, hour = hour))
    reading = 0
    for x in cursor:
        for y in x:
            reading = y
    reading += traffic[3]
    cursor.close()
    cursor = connector.cursor()
    cursor.execute("use gymtymtraffic")
    update_cmd = "update timeslots_wellnesstraffic set {day} = {reading} where hour = {hour}".format(day= day, reading = 0, hour = hour)
    cursor.execute(update_cmd)
    connector.commit()
    cursor.close()

# returns an array of <b> tags containing traffic
def return_raw_data():
    with urllib.request.urlopen('https://reboks.nus.edu.sg/nus_public_web/public/index.php/facilities/capacity') as fp:
        soup = BeautifulSoup(fp, 'html.parser')
        mpsh = soup.find("div", {"id" : 20}).b.text
        usc = soup.find("div", {"id" : 39}).b.text
        uTown = soup.find("div", {"id" : 26}).b.text
        wellness = soup.find("div", {"id" : 45}).b.text
        gyms = [mpsh, usc, uTown, wellness]
        
    return gyms

# takes in the raw data contained in <b> tags 
def get_traffic(gyms):
    count = 0
    traffic = [0, 0, 0, 0]
    for gym in gyms:
        temp = gym.split('/')[0]
        traffic[count] = int(temp)
        count = count + 1
    return traffic

# Overall Scrape 

def scrape_reboks():
    gyms = return_raw_data()
    hour = datetime.now().hour
    # hour = 7
    day = calendar.day_name[date.today().weekday()]
    day = (day[0 : 3]).lower()
    traffic = get_traffic(gyms)
    print(traffic)
    if hour >= 7 and hour < 22: 
        add_readings(day, hour)
        add_mpsh(day, hour, traffic)
        add_utown(day, hour, traffic)
        add_usc(day, hour, traffic)
        add_wellness(day, hour, traffic)
    
scrape_reboks()
