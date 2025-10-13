def find(search_list, value):
    lower = 0
    upper = len(search_list) - 1
    while lower <= upper:
        mid = (lower + upper) // 2
        if search_list[mid] == value:
            return mid
        if search_list[mid] > value:
            upper = mid - 1
        else:
            lower = mid + 1
    raise ValueError("value not in array")
