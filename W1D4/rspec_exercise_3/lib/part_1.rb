require "prime"

def is_prime?(num)
    Prime.prime?(num)
end

def nth_prime(num)
    p_arr = []
    (1..2**32).each do |n|
        if Prime.prime?(n)
            p_arr << n
        end
        if p_arr.length == num
            return p_arr[-1]
        end
    end
end

def prime_range(min, max)
    (min..max).select {|num| Prime.prime?(num)}
end

