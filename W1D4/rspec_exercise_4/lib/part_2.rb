def proper_factors(num)
    (1...num).select {|n| num % n == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    f_arr = []
    while f_arr.length < n
        (1..2**32).each do |num|
            if perfect_number?(num)
                f_arr << num
            end
        end
    end
    f_arr
end
