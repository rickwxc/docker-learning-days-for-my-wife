from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hello_world():
    debug = '0'
    if os.environ.get('FLASK_DEBUG'):
        debug = '1'

    return ('Hello, Flask and my name is ' + os.environ["ENV_MY_NAME"]  + ' and flask debug = ' + debug)


