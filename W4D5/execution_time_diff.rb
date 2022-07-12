# phase 1
def my_min(arr)
    cur_min = arr.first
    arr.each do |el|
        arr.each do |el2|
            if el2 < el && el2 < cur_min
                cur_min = el2
            end
        end
    end
    cur_min
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

# phase 2
def my_min2(arr)
    cur_min = arr.first
    arr[1..-1].each {|el| cur_min = el if el < cur_min }
    cur_min
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min2(list)  # =>  -5


def largest_contiguous_subsum(list)
    subarrs = []
    list.each_with_index do |ele, i|
        list.each_with_index do |ele2, i2|
            if i2 >= i
                subarrs << list[i..i2]
            end
        end
    end
    subarrs.map(&:sum).max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])


def largest_contiguous_subsum2(list)
    max_sum = (-2**32)
    curr_sum = 0
    list.each do |ele|
        curr_sum += ele
        curr_sum = ele if ele > curr_sum
        max_sum = curr_sum if curr_sum > max_sum
    end
    max_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])