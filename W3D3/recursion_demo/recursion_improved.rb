def merge_sort(arr)
    return arr if arr.length == 1
    if arr.length > 1
        mid_idx = arr.length / 2
        left_arr = arr.drop(mid_idx)
        right_arr = arr.take(mid_idx)
        left_ms = merge_sort(left_arr)
        right_ms = merge_sort(right_arr)
        merge(left_ms, right_ms)
    end
end


def merge(left_arr, right_arr)
    merged = []
    until left_arr.empty? || right_arr.empty?
        left_arr[0] < right_arr[0] ? merged << left_arr.shift : merged << right_arr.shift
    end
    merged + left_arr + right_arr
end

array = [38, 4, 3, 90, 100, 47, 31]
p merge_sort(array)