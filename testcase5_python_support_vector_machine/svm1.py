#!/usr/bin/python
from sklearn import svm
X = [[0, 0], [1, 1], [2, 2]]
y = [0, 1, 2]
clf = svm.SVC(gamma='auto')
clf.fit(X, y)
print "%s" % clf.predict([[1, 1]])
