#!/usr/bin/python
from sklearn.linear_model import LinearRegression
X = [[6, 0], [8, 0], [10, 0], [14, 0], [18, 0]]
y = [[7], [9], [13], [17.5], [18]]
model = LinearRegression()
# Training data
model.fit(X, y)
print 'A 12" pizza should cost: $%.2f' % model.predict([[12, 0]])
#Output: A 12" pizza should cost: $13.68
