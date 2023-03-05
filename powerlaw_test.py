import pandas as pd
from powerlaw import *
import matplotlib.pyplot as plt

df = pd.read_excel("/Users/chenweixun/Desktop/coding/論文/資料/營收網路.xlsx")

def cal_estimate(data):
	fit = Fit(data, discrete=True, xmin = (0, 2))
	R, p=fit.distribution_compare('power_law', 'exponential', normalized_ratio = True)
	print(f'{data.name}, alpha = {fit.power_law.alpha}, xmin =  {fit.power_law.xmin}, D = {fit.power_law.D}')
	print(f'loglikelihood ratio = {R}, p-value = {p}')



def plot_powerlaw(data):
	fit = Fit(data, discrete=True, xmin = (0, 2))
	# plot_pdf(data, label="Data as PDF")
	fit.plot_pdf(label="threshold PDF")
	ax1 = fit.power_law.plot_pdf(label="Fitted PDF", ls=":")
	# x, y = pdf(data, ax = ax1)
	# ax1.scatter(x[:-1], y, color='r', s=1)
	# plt.legend(loc=3, fontsize=14);
	plt.show()



# cal_estimate(df['degree_0.4'])
# cal_estimate(df['degree_0.5'])
# cal_estimate(df['degree_0.6'])
# cal_estimate(df['degree_0.7'])
cal_estimate(df['degree_0.8'])
cal_estimate(df['degree_0.9'])

# plot_powerlaw(df['degree_0.4'])
# plot_powerlaw(df['degree_0.5'])
# plot_powerlaw(df['degree_0.6'])
# plot_powerlaw(df['degree_0.7'])
plot_powerlaw(df['degree_0.8'])
plot_powerlaw(df['degree_0.9'])
