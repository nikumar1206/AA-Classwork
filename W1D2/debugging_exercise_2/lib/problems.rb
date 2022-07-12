# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def prime?(num)
    (2...num).each do |nums|
        if num % nums == 0
            return false
        end
    end
    true
end

def largest_prime_factor(num)
    factors = []
    (1..num).each do |nums|
        if num % nums == 0 && prime?(nums)
            factors << nums
        end
    end
    factors[-1]
end

def unique_chars?(str)
    counter = {}
    str.each_char do |char|
        if counter.include?(char)
            return false
        else
            counter[char] = 1
        end
    end
    true
end

def ana_array(arr1,arr2)
    counter1= Hash.new(0)
    counter2= Hash.new(0)
    arr1.each do |ele1|
        counter1[ele1] += 1
    end
    arr2.each do |ele2|
        counter2[ele2] += 1
    end
    counter1==counter2
end

def dupe_indices(arr)
    counter = {}
    arr.each_with_index do |ele, i|
        if arr.count(ele) > 1
            if counter.include?(ele)
                counter[ele] << i
            else
                counter[ele] = [i]
            end
        end
    end
    counter
end

