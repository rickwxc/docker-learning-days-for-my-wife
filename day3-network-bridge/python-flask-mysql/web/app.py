from flask import Flask
import os
import mysql.connector
app = Flask(__name__)

@app.route('/')
def hello_world():


    cnx = mysql.connector.connect(user='root', password='abcdefg', host='mysql-dev') #been defined in docker-compose.yml
    cursor = cnx.cursor()
    databases = ("show databases")
    cursor.execute(databases)
    msg = [] 
    for (databases) in cursor:
        msg.append(databases[0])

    cnx.close()


    return ('Hello, mysql connected, and has databases: ' + ','.join(msg) )


