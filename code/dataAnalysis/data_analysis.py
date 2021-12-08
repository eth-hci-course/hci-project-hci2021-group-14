# //--------------------------< imports >--------------------------\\

import matplotlib.pyplot as plt
import csv
import pandas as pd
from pandas import Series, DataFrame
import numpy as np
import statistics
from scipy import stats


# //--------------------------< declare variables >--------------------------\\

legend = []
data0 = [] # 1. index = expiriment instance; 2. index = data type
data = [] # 1. index = data type; 2. index = expiriment instance
dataA = []
dataB = []


other_legend = []
other_data0 = []
other_data = []
sus_dataA = []
sus_dataB = []


# //--------------------------< input >--------------------------\\

# read in csv-file
with open('crowdfunding_number_data.csv') as csvDataFile:
    csvReader = csv.reader(csvDataFile)

    for row in csvReader:
        data0.append(row)
    
    legend = data0[0]
    data0 = data0[1:] # 1. index = expiriment instance; 2. index = data type

for i in range(len(data0[0])):
    data.append([])
    for j in range(len(data0)):
        if (i==2 or i==3):
            data[i].append(float(data0[j][i]))
        else:
            data[i].append(data0[j][i])

dataA.append([data[0][i] for i in range(len(data[2])) if data[1][i] == 'A'])
dataA.append([data[2][i] for i in range(len(data[2])) if data[1][i] == 'A'])
dataA.append([data[3][i] for i in range(len(data[2])) if data[1][i] == 'A'])

dataB.append([data[0][i] for i in range(len(data[2])) if data[1][i] == 'B'])
dataB.append([data[2][i] for i in range(len(data[2])) if data[1][i] == 'B'])
dataB.append([data[3][i] for i in range(len(data[2])) if data[1][i] == 'B'])


# for SUS data
with open('crowdfunding_other_data.csv') as csvDataFile:
    csvReader = csv.reader(csvDataFile)

    for row in csvReader:
        other_data0.append(row)
    
    other_legend = other_data0[0]
    other_data0 = other_data0[1:] # 1. index = expiriment instance; 2. index = data type


for i in range(len(other_data0[0])):
    other_data.append([])
    for j in range(len(other_data0)):
        if j > 1:
            if i in [9,10,11,12,13,14,15,16,17,18,19]: #2=Pid, 3=A/B, 9-18=sus
                other_data[i].append(float(other_data0[j][i]))
            else:
                other_data[i].append(other_data0[j][i])

for j in range(12):
    sus_dataA.append([])
    sus_dataB.append([])
for i in range(len(other_data[0])):
    if other_data[3][i] == 'A':
        templist = []
        for j in [2,9,10,11,12,13,14,15,16,17,18]:
            templist.append(other_data[j][i])
        sus_score = 0
        for j in [1,3,5,7,9]:
            sus_score += templist[j]-1
        for j in [2,4,6,8,10]:
            sus_score += 5-templist[j]
        templist.append(sus_score*2.5)
        for j in range(12):
            sus_dataA[j].append(templist[j])
    else:
        templist=[]
        for j in [2,9,10,11,12,13,14,15,16,17,18]:
            templist.append(other_data[j][i])
        sus_score = 0
        for j in [1,3,5,7,9]:
            sus_score += templist[j]-1
        for j in [2,4,6,8,10]:
            sus_score += 5-templist[j]
        templist.append(sus_score*2.5)
        for j in range(12):
            sus_dataB[j].append(templist[j])


# //--------------------------< bar graph >--------------------------\\

width =0.3

plt.bar(np.arange(len(dataA[1])), dataA[1], width=width, label='Variant A')
plt.bar(np.arange(len(dataB[1]))+ width, dataB[1], width=width, label='Variant B')
plt.title('Time Needed')
plt.xlabel('Person')
plt.ylabel('Seconds')
plt.legend()
plt.show()

plt.title('Lostness')
plt.bar(np.arange(len(dataA[2])), dataA[2], width=width, label='Variant A')
plt.bar(np.arange(len(dataB[2]))+ width, dataB[2], width=width, label='Variant B')
plt.xlabel('Person')
plt.ylabel('Lostness Factor')
plt.legend()
plt.show()

# for SUS data
plt.title('SUS')
plt.bar(np.arange(len(sus_dataA[11])), sus_dataA[11], width=width, label='Variant A')
plt.bar(np.arange(len(sus_dataB[11]))+ width, sus_dataB[11], width=width,label='Variant B')
plt.xlabel('Person')
plt.ylabel('SUS-score')
plt.legend()
plt.show()


# //--------------------------< simple statistics >--------------------------\\

print()
print("mean of time needed [seconds]:")
print("A: " + str(statistics.mean(dataA[1])))
print("B: " + str(statistics.mean(dataB[1])))
print()
print("mean of lostness factor:")
print("A: " + str(statistics.mean(dataA[2])))
print("B: " + str(statistics.mean(dataB[2])))
print()
print("mean of SUS-score:")
print("A: " + str(statistics.mean(sus_dataA[11])))
print("B: " + str(statistics.mean(sus_dataB[11])))
print()

print("standard deviation of time needed [seconds]:")
print("A: " + str(statistics.stdev(dataA[1])))
print("B: " + str(statistics.stdev(dataB[1])))
print()
print("standard deviation of lostness factor:")
print("A: " + str(statistics.stdev(dataA[2])))
print("B: " + str(statistics.stdev(dataB[2])))
print()
print("standard deviation of SUS-score:")
print("A: " + str(statistics.stdev(sus_dataA[11])))
print("B: " + str(statistics.stdev(sus_dataB[11])))
print()


# //--------------------------< Shapiro-Wilk test >--------------------------\\

print("Shapiro-Wilk test on time needed:")
shapiro_test = stats.shapiro(dataA[1])
print("p-value for A: " + str(shapiro_test.pvalue) + ";   reject H_0: " + str(shapiro_test.pvalue <= 0.05))
shapiro_test = stats.shapiro(dataB[1])
print("p-value for B: " + str(shapiro_test.pvalue) + ";   reject H_0: " + str(shapiro_test.pvalue <= 0.05))
print()
print("Shapiro-Wilk test on lostness factor:")
shapiro_test = stats.shapiro(dataA[2])
print("p-value for A: " + str(shapiro_test.pvalue) + ";   reject H_0: " + str(shapiro_test.pvalue <= 0.05))
shapiro_test = stats.shapiro(dataB[2])
print("p-value for B: " + str(shapiro_test.pvalue) + ";   reject H_0: " + str(shapiro_test.pvalue <= 0.05))
print()


# //--------------------------< Paired t-test on time needed >--------------------------\\

print("Paired t-test on time needed:")
t_test = stats.ttest_rel(dataA[1], dataB[1], nan_policy='propagate', alternative='greater')
print("p-value: " + str(t_test.pvalue) + ";   reject H_0: " + str(t_test.pvalue <= 0.05))
print()


# //--------------------------< Wilcoxon signed rank test on lostness factor >--------------------------\\

print("Wilcoxon signed rank test on lostness factor:")
wilcoxon_test = stats.wilcoxon(dataA[2], y=dataB[2], alternative='two-sided', mode='auto')
print("p-value: " + str(wilcoxon_test.pvalue) + ";   reject H_0: " + str(wilcoxon_test.pvalue <= 0.05))
print()


# //--------------------------< Wilcoxon signed rank test on SUS-score >--------------------------\\

print("Wilcoxon signed rank test on SUS-score:")
wilcoxon_test = stats.wilcoxon(sus_dataA[11], y=sus_dataB[11], alternative='two-sided', mode='auto')
print("p-value: " + str(wilcoxon_test.pvalue) + ";   reject H_0: " + str(wilcoxon_test.pvalue <= 0.05))
print()


# //--------------------------< debug output >--------------------------\\

print("start test")

print("end test")
