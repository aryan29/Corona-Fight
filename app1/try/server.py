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
app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def getloc():
    if (request.method == 'POST'):
        data = request.json
        print(data['lat']+" "+data['lon'])
        return 'Response received'
    else:
        return 'Wrong Function Called'


def ifout(lat, lon):
    # Init lat1 and lon1
    # Get Person Correntine Lat and Lon
    # If diff is upto some lvl then take action and add to his dishonor points


if(__name__ == "__main__"):
    app.run(host="0.0.0.0", debug=True, port=5000)
