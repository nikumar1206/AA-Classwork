require "byebug"

def range(start, stop)
    return [] if stop <= start
    [start] + range(start + 1, stop)
end
# p range(1, 5)
# p range(5, 10)

def itr_sum(arr)
    sum = 0
    arr.each do |num|
        sum += num
    end
    sum
end
# p itr_sum([1,2,3,4,5])

def rec_sum(arr)
    return 0 if arr.length == 0
    arr[0] + rec_sum(arr[1..-1])
end
# p rec_sum([1,2,3,4,5])



def exp1(base, power)

    return 1 if power == 0

    base * exp1(base, power - 1)

end

# p exp1(2, 3)
# p exp1(10, 2)

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1

    exponent_shortcut = (power - 1)/ 2

    if power.even?
        exp2(base, power/2) * exp2(base, power/2)
    else
        base * (exp2(base, exponent_shortcut)) * (exp2(base, exponent_shortcut))
    end

end

# p exp2(2, 3)
# p exp2(2, 6)



def deep_dup(arr)

    return arr if !arr.is_a?(Array)

    new_grid = []

    arr.each do |subArr|
        new_grid << deep_dup(subArr)
    end

    new_grid
end

array = [[1, 2, 3, 4],[5, 6, 7, 8]]

p deep_dup(array)
def recfib(n)
    return [0] if n == 1
    return [0,1] if n == 2
    prev_fib = recfib(n -1) 
    prev_fib << prev_fib[-1] + prev_fib[-2]
end
# p recfib(8)

def itrfib(n)
    return [0] if n == 1
    fibs = [0,1]
    while fibs.length < n
        sum = fibs[-1] + fibs[-2]
        fibs << sum
    end
    fibs
end
# p itrfib(8)
# p itrfib(3)

def bsearch(arr, target)
    mid_idx = arr.length/ 2
    return nil if arr.length == 1 && arr[mid_idx] != target
    if target == arr[mid_idx]
        return mid_idx
    elsif target > arr[mid_idx]
       res = bsearch(arr[mid_idx+1..-1], target)
       if res != nil
            mid_idx + 1 + res
       else
            return nil
       end
    else #target is less than mid
        bsearch(arr[0..mid_idx-1], target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)

    if arr.length > 1

        mid_idx = arr.length / 2
        left_arr = arr[0...mid_idx]
        right_arr = arr[mid_idx..-1]

        left = merge_sort(left_arr)
        right = merge_sort(right_arr)

        merge(left, right)

    else
        return arr

    end

end

arr = [1, 2, 3, 4, 5, 6, 7, 8]

def merge(left_arr, right_arr)

    new_arr = []

    while !left_arr.empty? && !right_arr.empty?


        if left_arr[0] < right_arr[0]
            new_arr << left_arr.shift
        else
            new_arr << right_arr.shift
        end

    end
    new_arr += left_arr + right_arr

end
array = [38, 4, 3, 90, 100, 47, 31].shuffle
# p merge_sort(array)

def subsets(arr)
    return [[]] if arr.empty?
    saved = subsets(arr[0...-1])
    
    saved.each do |ele|
        ele << arr[-1]
    end
    subsets(arr[0...-1]) + saved
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
#p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]