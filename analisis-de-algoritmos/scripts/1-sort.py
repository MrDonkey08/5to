import random, time

start_time = 0
end_time = 0
random_arr = []
sorted_arr = []

min = 0
max = 100

# Random array

def gen_random(arr, min, max, N):
    #N = int(input("Digit the numbers of numbres to generate: "))

    for i in range(N):
        arr.append(int(random.randrange(min, max)))

    return N

# Search functions

def search(arr, target):
    count = 0
    for num in arr:
        if num == target:
            count += 1
    return count

# Sort functions

def sort(arr1, arr2, max):
    count = 0

    for i in range(max):
        count = search(arr1, i)

        for j in range(count):
            arr2.append(i)

    return arr2


# Time functions

def time_converted(sec):
    global timer

    mins = sec // 60
    sec %= 60
    hours = mins // 60
    mins %= 60
    #print("Time Lapsed = {0}:{1}:{2}".format(int(hours), int(mins), sec))
    timer = "Time Lapsed = {0}:{1}:{2}".format(int(hours), int(mins), sec)

    return timer

def stopwatch_start():
    global start_time
    start_time = time.time()

def stopwatch_end():
    global start_time, end_time

    end_time = time.time()
    time_lapsed = end_time - start_time
    time_converted(time_lapsed)

def print_arrs(N, times):
    for i in range(times):
        global min, max, random_arr, sorted_arr

        N = gen_random(random_arr, min, max, N)
        #print("Unsorted array: ", random_arr, max)

        stopwatch_start()
        sorted_arr = sort(random_arr, sorted_arr, max)
        #print("\nSorted array: ", sorted_arr)
        stopwatch_end()

print("\nArreglos pequeños\n")
print_arrs(1000, 10)

print("\nArreglos medianos\n")
print_arrs(10000, 10)

print("\nArreglos grandes\n")
print_arrs(100000, 10)

