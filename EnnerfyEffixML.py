import tensorflow as tf
import numpy as np
from tensorflow import keras
from tensorflow import lite
import os

# Disable oneDNN optimizations
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'
xvalue=float(input("xvalue"))
yvalue=float(input("yvalue"))
# Define your data
x = np.array([ 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0], dtype=float)
y = np.array([-1.03, -1.0, 1.0, 3.0, 5.0, 7.0, 9.0, 11.0,13.0, 15.0], dtype=float)
x = np.append(x,[xvalue])
y = np.append(y,[yvalue])

# Define the model
model = keras.Sequential([keras.layers.Dense(units=1, input_shape=[1])])
model.compile(optimizer='sgd', loss='mean_squared_error')
#training model using x and y dataset x is the input and y is the output epochs means the number of time dataset gonna train

num = int(input("enter the number of times you wanna trai the model"))
model.fit(x,y,epochs=num)
predictNum=int(input("enter the number you wanna predict"))
#predicting value
f1=model.predict([predictNum])
print(f1)

converter = tf.lite.TFLiteConverter.from_keras_model(model)
tfmodel = converter.convert()
open("linear.tflite","wb").write(tfmodel)
