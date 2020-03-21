# This server will be receiving response from the user about thier location
# And it will be having the last updated location for each user
# If bw two interval of location update time is greater than t(15min) we will add
# Disgace points to user profile
# Also if location is not near home then also add disgrace points and inform nearest authorities immediately about that

# There will be 1 more function which will be checking in whole user database if for any user last updated time is greater than t(15min) then
# it will be sending message to the registered number for informing the user about the same

# We willbe  making use of mobile GPS and Google Map Api to get user Latitude and Longiude and Alarm Manager to get Location at continuous time
# in Mobile Application

from flask import Flask, request, redirect, render_template
import requests
import json
import time
import base64
from pymongo import MongoClient
import urllib.parse
import datetime

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def getloc():
    if (request.method == 'POST'):
        data = request.json
        print(data['lat']+" "+data['lon'])
        return 'Response received'
    else:
        return 'Wrong Function Called'


@app.route('/register', methods=['GET', 'POST'])
def getregister():
    if (request.method == 'POST'):
        data1 = request.json
        print(data1)
        image = base64.b64decode(data1['b64img'])
        return "Reponse Received"


def ifout(lat, lon, username):
    print(lat, lon)
    lat1, lon1 = Databse.getlastlocation(username)

    # Get Person Correntine Lat and Lon
    # If diff is upto some lvl then take action and add to his disgrace points


def matchface():
    # Not Working good change if possible
    # AWS is best for purpose if we can make a account
    r = requests.post(
        "https://api.deepai.org/api/image-similarity",
        files={
            'image1': open('1.jpg', 'rb'),
            'image2': open('4.jpg', 'rb'),
        },
        headers={'api-key': 'd66a904a-3ff3-4f45-adea-231580cb521f'}
    )
    print(r.json())
    # Get User Current Pic as Well as His Pic from Database and send it to be checked by server


def sendmsg(msg):
    URL = 'https://www.sms4india.com/api/v1/sendCampaign'
    req_params = {
        'apikey': 'UIYAW70XJQAXSTBBBZQCRVLIZDJM3PM7',
        'secret': '08XJFGHFCQHBY88D',
        'phone': '7906224093',
        'usetype': 'stage',
        'message': msg,
        'senderid': 'SMSIND'
    }
    res = requests.post(URL, req_params)
    print(res.status_code)
    print(res.text)


class Auth:
    """Authenicate with the server"""

    def register(self, name, password, email, phone, lat, lon, disgrace):
        # Registering User
        cred = {
            "name": name,
            "password": password,
            "email": email,
            "phone": phone,
            "last-lat": lat,
            "last-lon": lon,
            "last_update": time.time(),
            "disgrace": disgrace,

        }
        client = MongoClient(
            f"mongodb+srv://aryan290:29062000@cluster0-2plut.mongodb.net/test?retryWrites=true&w=majority")
        db = client.test
        people = db.test
        if (self.check_if_already_exist(email, phone, people) == 1):
            people.insert_one(cred)
            print("Registered Successfully")
            return 1
        else:
            print("Not registered Successfully")
            return 0

    def login(self, email, password):
        client = MongoClient(
            f"mongodb+srv://aryan290:29062000@cluster0-2plut.mongodb.net/test?retryWrites=true&w=majority")
        db = client.test
        people = db.test
        x = people.find_one({"email": email, "password": password})
        if(x == None):
            print("Login Unsuccesful")
        else:
            print("Login Successfull")
        # For logging in

    def check_if_already_exist(self, email, phone, database):
        print(database.find({"email": email}))
        print(database.find({"phone": phone}))
        if (database.find_one({"email": email}) == None and database.find_one({"phone": phone}) == None):
            print("Can be registered")
            return 1
        else:
            print("EmailId or Password Already regustered")
            return 0


class Databse:
    """
    Contains all Mongo DB Atlas functions Add all of them here
    """

    def mongoexampleconn():
        client = MongoClient(
            f"mongodb+srv://aryan290:29062000@cluster0-2plut.mongodb.net/test?retryWrites=true&w=majority")
        db = client.test
        people = db.test
        personDocument = {
            "name": "aryan22",
            "password": "kuchbhi99",
            "last-lat": "something",
            "last-lon": "something",
            "last_update": "something",
            "time": "",
            "disgrace": 0,

        }
        # people.insert_one(personDocument)
        people.update_one({"name": "aryan2"}, {
            "$set": {"password": "change ho jayega"}})
        for x in (people.find({})):
            print(x)

    def getlastlocation(self, username):
        client = MongoClient(
            f"mongodb+srv://aryan290:29062000@cluster0-2plut.mongodb.net/test?retryWrites=true&w=majority")
        db = client.test
        people = db.test
        x = people.find_one({"name": username})
        lat = x['last-lat']
        lon = x['last-lon']
        return lat, lon

    def update_disgrace_points(self, username, val):
        client = MongoClient(
            f"mongodb+srv://aryan290:29062000@cluster0-2plut.mongodb.net/test?retryWrites=true&w=majority")
        db = client.test
        people = db.test
        people.update_one({"name": username}, {
            "$inc": {"quantity": val}})


if (__name__ == "__main__"):
    #Auth().register("Aryan", "900", "hello12489@gmail.com", "900800", "81", "63", "0")
    # Auth().login("hello@gmail.com", "9900")
    app.run(host="0.0.0.0", debug=True, port=5000)
