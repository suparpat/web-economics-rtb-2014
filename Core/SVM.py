from sklearn import svm
from sklearn.svm import SVC
import csv
import pywt
import math
import ast
X = []
y = []
X_test = []
y_test = []
def main():

	f = open('../data_training_sample_extracted.txt', 'r')

	for line in f:
		x_line = line.split(',')
		y_line = x_line.pop(0)
		X.append(x_line)
		y.append(y_line)



	#fit support vector machine
	highest = 0
	highestGamma = 0
	print("read in data, about to do SVM fitting...'")
	for g in range(1,80):
		gam = 1.0/g
		clf = svm.SVC(C=1.0, cache_size=200, class_weight='auto', coef0=0.0, degree=gam,
		gamma=gam, kernel='rbf', max_iter=-1, probability=True, random_state=None,
		shrinking=True, tol=0.001, verbose=False)
		clf.fit(X,y)	
	#	print('training err: %f ' %clf.fit(X,y).score(X,y))
#		print('gamma: %f ' %gam)
		print(getError(clf.predict_proba(X), y))
		#print("gamma")
def getError(preds, y):
	total = 0
	count = 1
	for tmp_preds in preds:
		total += (float(y[count]) - (1.0 -float(tmp_preds[int(y[count])])))**2
	print("total : %d",total); 
	return (total / len(y))**0.5	
		

main()
