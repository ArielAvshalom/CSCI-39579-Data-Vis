# -*- coding: utf-8 -*-
"""
Created on Tue Jun 22 18:19:03 2021

@author: Ariel
"""
import pandas as pd 
import numpy as np 
from datetime import datetime

# stats
from statsmodels.tsa.seasonal import seasonal_decompose
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf, month_plot, quarter_plot

# plotting libraries
import seaborn as sns
import plotly.express as px
import matplotlib.pyplot as plt

plt.style.use('seaborn')
plt.rcParams["figure.figsize"] = (16, 8)

#We have some nice data about flights from seaborn

flights = sns.load_dataset("flights")

flights['report_date'] = flights.apply(lambda x: datetime.strptime(f"{x['year']}-{x['month']}", '%Y-%b').date(), axis = 1)

#Regular old plot using the Pandas DataFrame plot feature

flights.plot(x = 'report_date', y = 'passengers', title = 'The flights of aeternity')

#plotly is an interactive graph displayer
pd.options.plotting.backend = "plotly"

sns.lineplot(data = flights, x = 'report_date', y = "passengers").set_title("Papers Please")

sns.lineplot(data = flights, x = "month", y = "passengers", hue = 'year', legend = "full")

plt.title("sns plot 42")
plt.legend(bbox_to_anchor = (1.05, 1), loc = 2);

flights = flights.set_index("report_date")
flights.index = pd.DatetimeIndex(flights.index, freq = 'MS')
month_plot(flights["passengers"], ylabel = "passengers for peace with the living dead")

fig = px.line_polar(flights, r = 'passengers', theta = 'month', color = 'year', line_close=True, title = "Emerald!", width = 600, height = 600).show()

fig.show()

decompose = seasonal_decompose(flights['passengers'], model = 'multiplicative', period = 12)
decompose.plot()


fig, ax = plt.subplots(2)
plot_acf(flights['passengers'], ax = ax[0])
plot_pacf(flights['passengers'], ax = ax[1])
