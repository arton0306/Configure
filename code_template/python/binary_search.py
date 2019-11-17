def binary_search(formula, lower = 0.0, upper = 1.0, error = 1e-3):
    while True:
        mid = (lower + upper) / 2
        v = formula(mid)
        if mid < v:
            lower = mid
        else:
            upper = mid
        if abs(mid-v) < error:
            break
    return mid
