#!/usr/bin/python
from sklearn.svm import SVC
svc = SVC(kernel='linear')
X_train = [[0, 0], [1, 1], [2, 2]]
y_train = [0, 1, 2]
svc.fit(X_train, y_train)
y_pred = svc.predict([[0.5,2]])
print "%s" % y_pred