#!/usr/bin/python
#Reference #1: http://benalexkeen.com/decision-tree-classifier-in-python-using-scikit-learn/
#Reference #2: https://www.datacamp.com/community/tutorials/decision-tree-classification-python
import pandas as pd

df = pd.read_csv('./alert_fast2.csv', index_col='No.')
print "Dataset Size : ", df.shape
print(df.head(10))

#We will be using Threat, Category, Proto, Src_ip, Src_port, Dst_ip, and Dst_port to predict the Result.
#Failed: Category, Src_ip, and Dst_ip are not integer values.
#df = df[['Threat', 'Category', 'Proto', 'Src_ip', 'Src_port', 'Dst_ip', 'Dst_port', 'Result']]
df = df[['Proto', 'Src_port', 'Dst_port', 'Result']]

#We need to convert those strings into integer values.
df['Result'] = df['Result'].map({'yes': 1, 'no': 0})
df['Proto'] = df['Proto'].map({'TCP': 1, 'UDP': 2, 'ICMP': 3, 'IP': 4})

#Drop any rows with missing values.
df = df.dropna()

X = df.drop('Result', axis=1)
y = df['Result']

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=1)

from sklearn import tree
model = tree.DecisionTreeClassifier()

model.fit(X_train, y_train)

y_predict = model.predict(X_test)
from sklearn.metrics import accuracy_score
print "Accuracy : ", accuracy_score(y_test, y_predict)

# Making a Prediction On a New Sample
sample_one_pred = int(model.predict([[1, 1043, 80]]))
sample_two_pred = int(model.predict([[1, 1041, 80]]))
print "Sample_one_pred : ", sample_one_pred
print "Sample_two_pred : ", sample_two_pred

#Print out the tree
#from sklearn.tree.export import export_text
#from scikit.tree import export_text
#print(export_text(model))
