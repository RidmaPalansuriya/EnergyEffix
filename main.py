import pandas as pd
import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import matplotlib.pyplot as plt
print(tf.__version__)
column_names=['day','date','time','volatage','current','power','units','cunit']
raw_datset=pd.read_csv('/content/energyyyy.csv',names=column_names,na_values='?',comment='\t',sep=",",index_col=False,skiprows=1)
dataset = raw_datset.copy()
dataset.tail()
dataset.isna().sum()
dataset=dataset.dropna()
dataset
dataset.isna().sum()
dataset.pop('time')
dataset.pop('date')
dataset.pop('volatage')
dataset.pop('current')
dataset.pop('power')
dataset.pop('units')
train_dataset = dataset.sample(frac=0.8,random_state=0)
test_dataset=dataset.drop(train_dataset.index)
train_status = train_dataset.describe()
train_status
units =train_dataset['cunit']
days =train_dataset['day']
plt.plot(days, units)
test_status=test_dataset.describe()
test_status
train_labels=train_dataset.pop('cunit')
test_label=test_dataset.pop('cunit')
train_dataset
train_status=train_dataset.describe()
train_status
train_status=train_status.transpose()
train_status
def norm(x):
  return (x-train_status['mean']/train_status['std'])
norm_train_data=norm(train_dataset)
norm_test_data=norm(test_dataset)
def build_model():
  model = keras.Sequential([layers.Dense(64,activation='relu', input_shape=[len(train_dataset.keys())]),
                           layers.Dense(60,activation='relu'),
                            layers.Dense(1)])
  optimizer = tf.keras.optimizers.RMSprop(0.001)
  model.compile(loss='mse',optimizer=optimizer,metrics=['mae','mse'])
  return model
model =build_model()
model.summary()
model.fit(
  norm_train_data,train_labels,epochs=1000
)
loss,mae,mse=model.evaluate(norm_test_data,test_label,verbose=0)
loss,mae,mse
test_prediction=model.predict(norm_test_data).flatten()
test_prediction
test_label
keras_file="energyeffix1.h5"
tf.keras.models.save_model(model,keras_file)
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tfmodel=converter.convert()
open("aenergyeffix1.tflite","wb").write(tfmodel)
len(train_dataset.keys())
model=keras.models.load_model('/content/energyeffix1.h5')
input_data = np.array([[6950]])  # Assuming you're predicting for a single sample with value
input_data1 = np.array([[6949]])
test_prediction = model.predict(input_data)
test_prediction1 = model.predict(input_data1)
print(test_prediction-test_prediction1)