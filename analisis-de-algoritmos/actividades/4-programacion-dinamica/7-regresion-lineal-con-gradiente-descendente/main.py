import pandas as pd
import os
import numpy as np
import sympy as sp
from tkinter import filedialog
import random

LEARNING_RATE = 0.1 
MIN_STEP_SIZE = 0.001
MAX_NUM_STEPS = 100
RAND_FACT = 0.5

# CSV Functions!

def read():
	current_directory = os.getcwd()
	filetypes = [('Archivos CSV', '*.csv')] # Set only CSV files
	# Asks for the file
	file = filedialog.askopenfilename(initialdir=current_directory, filetypes=filetypes)

	if file:
		df = pd.read_csv(file, header=0)

		countries = get_countries(df)
		prizes = get_prizes(df)
		consumption = get_consumption(df)

	return countries, prizes, consumption

def get_countries(df):
	countries = df['Country'].tolist()
	return countries

def get_prizes(df):
	prizes = df['Nobel prizes per capita (scaled by 10 million)'].tolist()
	return prizes

def get_consumption(df):
	return df['Per capita chocolate consumption (kg)'].tolist()

# CSV Functions!!!

p, q = sp.symbols('p q')

def gen_sums_exps(x, y): # gen expressions of sum of squared residuals and slopes
	intercept = []
	slope = [] 
	sums = []

	for i in range(len(x)):
		sums.append((x[i] - p + q * y[i]) ** 2)
		intercept.append(sp.diff(sums[i], p))
		slope.append(sp.diff(sums[i], q))

	return sums, intercept, slope

def loss_fn(intercept, slope, exp_sums, exp_intercept, exp_slope, x):
	global LEARNING_RATE

	residual = new_slope = new_intercept = 0

	for i in range(len(x)):  # sum of squared residuals
		residual += exp_sums[i].subs({p: intercept, q: slope})
		new_slope += exp_slope[i].subs({p: intercept, q: slope})
		new_intercept += exp_intercept[i].subs({p: intercept, q: slope})

	intercept_step_size = new_intercept * LEARNING_RATE
	new_intercept = intercept - intercept_step_size

	slope_step_size = new_slope * LEARNING_RATE
	new_slope = slope - slope_step_size

	return residual, new_intercept, new_slope, intercept_step_size, slope_step_size

def main():
	countries, prizes, consumption = read()
	residual = slope = num_steps = intercept = 0
	slope = 1

	intercepts = []
	slopes = []

	intercept_step_size = slope_step_size = MIN_STEP_SIZE + 1

	exp_sums, exp_intercept, exp_slope = gen_sums_exps(prizes, consumption)
	
	while (slope_step_size > MIN_STEP_SIZE or intercept_step_size > MIN_STEP_SIZE) and num_steps < MAX_NUM_STEPS:
		residual, intercept, slope, intercept_step_size, slope_step_size = loss_fn(intercept, slope, exp_sums, exp_intercept, exp_slope, prizes)

		rand_num = random.random() # between 0 and 1

		intercepts.append(intercept)
		slopes.append(slope)

		if rand_num > RAND_FACT:
			intercept_step_size += rand_num
			slope_step_size += rand_num

			residual, intercept, slope, intercept_step_size, slope_step_size = loss_fn(intercept, slope, exp_sums, exp_intercept, exp_slope, prizes)

			intercepts.append(intercept)
			slopes.append(slope)

			if intercepts[-1] > intercepts[-2]:
				intercept = intercepts[-1]
			else: 
				intercepts.pop()

			if slopes[-1] > slopes[-2]:
				slope = slopes[-1]
			else:
				slopes.pop()


		num_steps += 1

	print("The generated equation is y =", intercept, "+", slope, "* x\n") # Linear regresion with Gradient Descent equation

	input_value = float(input("Digit a value: "))

	print("\nThe estimaded value for", input_value, "is",  intercept + slope * input_value) 

if __name__ == "__main__":
	main()
