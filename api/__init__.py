from flask import Flask, request
import pymongo
import json
app = Flask(__name__)

def connectToDB():
    myclient = pymongo.MongoClient("mongodb://localhost:27017/")
    return myclient["catieAPI"]

@app.route('/sign_up')
def signup():
    user = request.args.get('user')
    password = request.args.get('password')
    db = connectToDB()["accounts"]
    if user and password:
        query = {"username": user}
        check = db.find(query)
        for x in check:
            return json.dumps({"message": "username taken"})
        new_user = {"username": user, "password": password}
        db.insert_one(new_user)
        return json.dumps({"message": "OK"})
    return json.dumps({"message": "query unreadable"})

@app.route('/login')
def login():
    user = request.args.get('user')
    password = request.args.get('password')
    #Check to see if user exists in DB
        #If no, return error
    #Else return the user
    if user and password:
        query = {"username": user}
        check = db.find(query)
        for x in check:
            ret = {"message": x.username + "was logged in succesfully"}
            return json.dumps(ret)
        return json.dumps({"message":"User does not exist"})
    return json.dumps({"message": "query unreadable"})

@app.route('/user_info')
def user_info():
    user = request.args.get('user')
    #Check to see if user exists in DB
        #If no, return error
    #Else return the user
    if user:
        query = {"username": user}
        check = db.find(query)
        for x in check:
            ret = {"username": x.username}
            return json.dumps(ret)
        return json.dumps({"message":"User does not exist"})
    return json.dumps({"message": "query unreadable"})
