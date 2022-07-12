def two_sum?(arr, target_sum)
    arr.each_with_index do |e1,i1|
        arr.each_with_index do |e2,i2|
            return true if i2>i1 && e1+e2==target_sum
        end
    end
    false
end

def bsearch(arr, target)
    return nil if arr.empty?
    p_index = arr.count/2
    pivot = arr[p_index]
    return p_index if pivot == target
    if pivot > target
        bsearch(arr.take(p_index),target)
    else
      right = bsearch(arr.drop(p_index+1),target)
      return right if right.nil?
      right + p_index + 1
    end
end

  
def okay_two_sum?(arr,target)
    arr.sort!
    arr.each_with_index do |e,i|
        if bsearch(arr,(target - e)) != nil && bsearch(arr,(target - e))!= i
            return true
        end
    end
    false
end

arr = [0, 1, 5, 7]
# arr = [7,1,0,5]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
