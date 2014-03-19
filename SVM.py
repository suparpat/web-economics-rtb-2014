from sklearn import svm
from sklearn.svm import SVC
import csv
import pywt
import math
X = []
y = []
X_test = []
y_test = []
def main():

	f = open('JKfeatures.csv', 'r')

	for line in f:
		x_line = line.split(',')
		y_line = x_line.pop(0)
		X.append(x_line)
		y.append(y_line)

	f = open('DCfeatures.csv', 'r')
	for line in f:
		x_line = line.split(',')
		y_line = x_line.pop(0)
		X_test.append(x_line)
		y_test.append(y_line)



	#fit support vector machine
	highest = 0
	highestGamma = 0
	for g in range(2,3):
		gam = 6
		clf = svm.SVC(C=1.0, cache_size=200, class_weight='auto', coef0=0.0, degree=gam,
		gamma=gam, kernel='poly', max_iter=-1, probability=False, random_state=None,
		shrinking=True, tol=0.001, verbose=False)
		
	#	print('training err: %f ' %clf.fit(X,y).score(X,y))
#		print('gamma: %f ' %gam)
		score = clf.fit(X,y).score(X_test,y_test)
	        if score > highest:
			highest = score
			highestGamma = gam
		clf.fit(X,y)
		print('highest test precision: %f' %highest)
		print('highest gamma: %f' %highestGamma)
		getPrecision('1', X_test,y_test, clf)
        	getPrecision('2', X_test,y_test, clf)
		getPrecision('3', X_test,y_test, clf)
		getPrecision('4', X_test,y_test, clf)
		getPrecision('5', X_test,y_test, clf)
		getPrecision('6', X_test,y_test, clf)
		getPrecision('7', X_test,y_test, clf)

		#print("gamma")


def getPrecision(label, X_test,y_test, clf):
	correct = 0
	tested = 0
	print(y_test)
	print(clf.predict(X_test))
	for i in range(0, len(y_test) -1):
		if y_test[i] == label:
			
			if y_test[i] == clf.predict(X_test[i]):			
				correct = correct+1
			tested = tested + 1
	print('label = %d', label)
	if(tested != 0):		
        	print(float(correct)/tested)


main()
