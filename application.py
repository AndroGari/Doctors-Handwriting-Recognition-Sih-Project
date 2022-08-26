from math import expm1

import joblib
import pandas as pd
from flask import Flask, jsonify, request
from tensorflow import keras

app = Flask(__name__)
model = keras.models.load_model("../input/weights90epoch/prediction_model_ocrf.h5")
import shutil
shutil.rmtree("./prediction")
os.mkdir('./prediction')
path='./prediction'
@app.route('/', methods=['GET'])
def home():
  return render_template('index.html')

@app.route("/predict", methods=["POST"])
def index():
    data = request.json
    img=cv2.imread(data)
    cv2.imwrite(os.path.join(path,'1.jpg'),data)
    
    return jsonify(prescription_resultword('./prediction/1.jpg'))

if '__name__'=='__main__':
    app.run(host='localhost',port=5000,debug=True)
