#!/usr/bin/python
from sklearn import linear_model
reg = linear_model.LinearRegression()
reg.fit ([[0, 0], [1, 1], [2, 2]], [0, 1, 2])
print "Answer is %s " % reg.predict([[1.5, 1.5], [3, 3]])
