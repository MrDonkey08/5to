import os, random

def get_random():
	arr = []

	opt = int(input("How many numbers do you want to save in the list?"))
	
	print("Digits the numbers to save\n")

	for i in range(opt):
		arr.append(int(input(i, ": ")))

	return arr

def gen_random(min, max):
	arr = []

	n = int(input("Digit the numbers of numbers to generate: "))

	for i in range(n):
		arr.append(int(random.randrange(min, max)))

	return arr

def subset_sum(arr, target_sum):
    n = len(arr)

    # Function to generate all subsets that sum up to the target
    def gen_subsets(i, current_subset, current_sum):
        if current_sum == target_sum:
            print(current_subset)
        if i == n or current_sum >= target_sum:
            return
        # Include the current element in the subset
        gen_subsets(i + 1, current_subset + [arr[i]], current_sum + arr[i])
        # Exclude the current element from the subset
        gen_subsets(i + 1, current_subset, current_sum)

    # Start recursion from i 0, an empty subset, and sum 0
    gen_subsets(0, [], 0)

def main_menu():
	print('''System Menú\n
1. Generate random list
2. Create list
3. Print list
4. Check subsests sums problem
5. Exit program\n
''')

def check_subset_sum(arr):
	print("Digit the integer target\n")

	target = (int(input("Integer target: ")))

	print("Subsets that sum up to", target, ":")

	subset_sum(arr, target)

opc = 0
arr = []

while(opc != 5):
	main_menu()
	opc = int(input("Option: "))
	print("")

	if(opc == 1):
		arr = gen_random(0, 10)
	elif(opc == 2):
		arr = get_random()
	elif(opc == 3):
		print("List:", arr)
	elif(opc == 4):
		if(arr): # arr return true if arr is not empty
			check_subset_sum(arr)
		else:
			print("Empty list: first fill the list")
	else:
		print("Invalid option. Try again")

	input("\nPress <enter> to continue")

	os.system('cls')
