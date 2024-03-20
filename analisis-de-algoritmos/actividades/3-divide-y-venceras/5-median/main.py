import random

def gen_random(arr, min, max):
    n = int(input("Digit the numbers of numbers to generate: "))

    for i in range(n):
        arr.append(int(random.randrange(min, max)))

    return arr

def median_of_medians(A, i):

    #divide A into sublists of len 5
    sublists = [A[j:j+5] for j in range(0, len(A), 5)]
    medians = [sorted(sublist)[len(sublist)//2] for sublist in sublists]
    if len(medians) <= 5:
        pivot = sorted(medians)[len(medians)//2]
    else:
        #the pivot is the median of the medians
        pivot = median_of_medians(medians, len(medians)//2)

    #partitioning step
    low = [j for j in A if j < pivot]
    high = [j for j in A if j > pivot]

    k = len(low)
    if i < k:
        return median_of_medians(low,i)
    elif i > k:
        return median_of_medians(high,i-k-1)
    else: #pivot = k
        return pivot

def print_median_arr(arr):
    print("List:", arr)

    arr_len = len(arr)

    mid = arr_len // 2

    if arr_len % 2 != 0:
        print ("Median: ", median_of_medians(arr, (arr_len // 2))) # Only works wit odd list
    else:
        print(mid)

        mid_l = median_of_medians(arr, mid - 1)
        mid_r = median_of_medians(arr, mid)

        print("Median: (", mid_l, "+", mid_r, ") / 2 =", (mid_l + mid_r) / 2)

'''def get_medium(arr, n): # n is the size arr
    def convert_mat(arr, n, i): # i is the column size (numbers of rows)
        mat = [[]]

        mat_rows_cos = n // ROW_SIZE
        mat_rows_res = n % ROW_SIZE

        i = k = 0

        for i in range(mat_rows_cos):
            for j in range(ROW_SIZE):
                mat[i].append(arr[k])

        if mat_rows_res != 0:
            i += 1
            k += 1

            for i in range(i, mat_row_res):
                mat[i+1].append(arr[k])
'''

def main():
    arr = []

    arr = gen_random(arr, 1, 9)
    print_median_arr(arr)


if __name__ == "__main__":
    main()
