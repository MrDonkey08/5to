import os

def clean_screen():
	# For Windows
	if os.name == 'nt':
		os.system('cls')

	# For Unix/Linux/MacOS
	else:
		os.system('clear')