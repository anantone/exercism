def find(search_list, value):
    if search_list == [] or value not in search_list:
        raise ValueError("value not in array")
    lower = 0
    upper = len(search_list)
    while lower <= upper:
        mid = (lower + upper) // 2
        if search_list[mid] == value:
            return mid
        if search_list[mid] > value:
            upper = mid - 1
        else:
            lower = mid + 1

