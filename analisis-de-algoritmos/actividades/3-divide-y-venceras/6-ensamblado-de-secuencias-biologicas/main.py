import pandas as pd
from tkinter import filedialog
import os

# CSV Functions!

def read():
	current_directory = os.getcwd()
	filetypes = [('Archivos CSV', '*.csv')] # Set only CSV files
	# Asks for the file
	file = filedialog.askopenfilename(initialdir=current_directory, filetypes=filetypes)

	if file:
		df = pd.read_csv(file, header = 0)

		fragments = get_fragments(file)
		string = get_string(file)

	return file, string, fragments

def get_fragments(file):
	df = pd.read_csv(file, header = 0)
	fragments = df['fragmentos'].tolist()
	return fragments

def get_string(file):
	df = pd.read_csv(file, header = 0)
	return df['secuencia_objetivo'][0]

# CSV Functions!!!

# Check the string that is repeated in the second arr, deletes it and concatenate the left into arr
def merge_fragments(string_1, string_2):
	# Checks all subarrays
	for i in range(len(string_2), 0, -1):
	# Checks if the substring of i size math with the end of the first string
		if string_1.endswith(string_2[:i]):
			return string_2[i:]
	
	return "" # if not match return empty


def main():
	file, target_string, fragments = read()

	merged_fragments = fragments[0] # The first fragment does not need "convertion"


	for i in range(len(fragments)-1):
		merged_fragments += merge_fragments(fragments[i], fragments[i+1])

	print("Target:", target_string) # CSV string
	print("Result:", merged_fragments) # String made with CSV fragments

	# returns false because the target String has 2 aditional chars 
	print("Is target equal?", merged_fragments == target_string) 
	print("Is target a subset?", merged_fragments in target_string) # returns true

if __name__ == "__main__":
	main()