# //--------------------------< imports >--------------------------\\

import matplotlib.pyplot as plt
import csv
import pandas as pd
from pandas import Series, DataFrame
import numpy as np


# //--------------------------< declare variables >--------------------------\\

legend = []
data0 = [] # 1. index = expiriment instance; 2. index = data type
data = [] # 1. index = data type; 2. index = expiriment instance
dataA = []
dataB = []


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


# //--------------------------< bar graph >--------------------------\\

#plt.bar(dataA[0], dataA[1])
#plt.show()

width =0.3
plt.bar(np.arange(len(dataB[1])), dataA[1], width=width)
plt.bar(np.arange(len(dataB[1]))+ width, dataB[1], width=width)
plt.title('Time Needed')
plt.xlabel('Person')
plt.ylabel('Seconds')
plt.show()

plt.title('Lostness')
plt.bar(np.arange(len(dataB[2])), dataA[2], width=width)
plt.bar(np.arange(len(dataB[2]))+ width, dataB[2], width=width)
plt.xlabel('Person')
plt.ylabel('Lostness Factor')
plt.show()


# //--------------------------< debug output >--------------------------\\

print("start test")

print("end test")