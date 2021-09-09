#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 24 15:26:30 2019

@author: ltremant
"""


import csv
import matplotlib.pyplot as plt
from labellines import labelLine, labelLines #https://github.com/cphyc/matplotlib-label-lines
import numpy as np


to_display = ["rke2[1]","int3[1]","rke3[1]","rke4[2]","int3[2]"]
plt.figure(figsize=(12,6))

ymarkers = ['D', 'o', 's', '^', 'p', 'v']


def plot_convergence(filename):
    # store data
    xdata = []
    ylabels = []
    ydata = []
    
    with open(filename) as csvfile:
        readCSV = csv.reader(csvfile, delimiter=',')
        fst_line_data = next(readCSV)
        xdata = list(map(int,fst_line_data[1:]))
        for row in readCSV:
            ylabels.append(row[0])
            ydata.append(list(map(float,row[1:])))
    
    # convert the log2(dt) into dt
    xdata = list(map(lambda x: 2.0**x,xdata))
    
    # display only what we want to be displayed
    marker_iterator = 0
    for (lab,yy) in zip(ylabels,ydata):
        if lab.lower() in to_display:
            plt.plot(xdata, yy, label=lab, marker=ymarkers[marker_iterator])
            marker_iterator = (marker_iterator+1)%len(ymarkers)


plt.subplot(121)
plot_convergence("sup_on_eps_scal.csv")
ord2_x = np.linspace(1e-1,1e-3, num=10000)
ord3_x = np.linspace(1e-1,4e-3, num=10000)
plt.plot(ord2_x, 0.2*ord2_x**2,linestyle='--',color='k', label="order 2")
plt.plot(ord3_x, 0.08*ord3_x**3,linestyle='--',color='k', label="order 3")
plt.xscale("log")
plt.yscale("log")

lines = plt.gca().get_lines()
labelLine(lines[-2], 1e-2)
labelLine(lines[-1], 5e-2)
#labelLines(lines)

plt.subplot(122)
plot_convergence("sup_on_eps_osci.csv")

ord2_x = np.linspace(1e-2,1e-4, num=10000)
ord3_x = np.linspace(7e-2,1e-3, num=10000)
cv_ord2 = plt.plot(ord2_x, 0.01*ord2_x**2,linestyle='--',color='k', label="order 2")
cv_ord3 = plt.plot(ord3_x, 0.007*ord3_x**3,linestyle='--',color='k', label="order 3")
#cv_ord4 = plt.plot([1e-1,4e-3],[1e-6,64e-14],linestyle='--',color='k', label="order 4")

plt.xscale("log")
plt.yscale("log")

lines = plt.gca().get_lines()
labelLine(lines[-2], 7e-4)
labelLine(lines[-1], 5e-3)
plt.legend([p.get_label() for p in lines[:-2]])
#labelLines(lines)

plt.tight_layout()
plt.show()
