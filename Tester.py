arr = [16, 18, 19, 21, 2, 23, 24, 3, 4, 5, 6, 9, 22, 23, 24]
sorted_arr = []
temp_arr = arr


for i in range(0, len(arr)):
  low = max(arr)
  for i in range(0, len(arr)):
    if arr[i] <= low and arr[i] not in sorted_arr:
      low = arr[i]
    elif arr[i] == low:
      low = arr[i]
  sorted_arr.append(low)
  

print(sorted_arr)