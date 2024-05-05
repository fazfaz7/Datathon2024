#-----------------Esta es la inicializacion de la base de datos-------------------------
#Importamos las librerias
import os
from pickle import TRUE
from dotenv import load_dotenv 
from flask import Flask, request
from flask_cors import CORS
from openai import OpenAI
import os

import json

app = Flask(__name__) #Inicializamos Flask
CORS(app)

load_dotenv()
client = OpenAI(
    # This is the default and can be omitted
    api_key=os.environ.get("OPENAI_API_KEY"),
)

def get_chatgpt_response(messages):
    '''
    response = openai.ChatCompletion.create(
        model='gpt-3.5-turbo',
        messages=messages
    )'''

    
    response = client.chat.completions.create(
        messages=[
            {
                "role": "user",
                "content": "The following message is from a recording. Analyze it and just respond with NOTHING MORE than a json that contains the amount of money, the description of the transaction (at most five words) and if it is an earning or spending. Those will be named in the json as concepto, monto and tipo. All values must be strings. The 2 only possible options for tipo are ingreso and egreso",
            },
            {
                "role": "system",
                "content": "I understand, I will respond with nothing more that the json you asked for, in the order concepto, monto and tipo.",
            },
            {
                "role": "user",
                "content": messages,
            }
        ],
        model="gpt-3.5-turbo",
    )

    print(response.choices[0].message.content)
    return json.loads(response.choices[0].message.content)

#--------------------------Estas son las llamadas a la base de datos--------------------------------

@app.route('/', methods=["POST"])
def getChatResponse():
    '''return{
        "status": "chat not available"
    }'''
    messages = request.json['messages']
    print(messages)
    model_response = get_chatgpt_response(messages)
    return {"response": model_response}

if __name__ == "__main__":
    app.run(debug=True) #Con el True en debug se reinicia cuando hay cambios