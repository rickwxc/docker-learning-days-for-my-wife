from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hello_world():
    return ('Hello, Flask and my name is ' + os.environ["ENV_MY_NAME"]  + ' and flask debug = ' + os.environ["FLASK_DEBUG"]  )


