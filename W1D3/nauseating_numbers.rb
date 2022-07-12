def strange_sums(arr)
    counter = Hash.new(0)
    arr.each do |ele|
        target = 0 - ele
        if arr.include?(target)
            counter[ele] = target
        end
    end
    counter.keys.length/2
end
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

def pair_product(arr, product)
    arr.each_with_index do |ele, i|
        target = product.to_f/ele
        return true if arr.include?(target) && (i != arr.index(target))
    end
    false
end
p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

# dont to_f the result of math. its already lost the decimal!
def rampant_repeats(str, hash)
    f_str = ''
    str.each_char do |char|
        if hash.include?(char)
            f_str += char * hash[char]
        else
            f_str += char
        end
    end
    f_str
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def perfect_square(num)
    (1..num).any? {|n| n * n == num }
end


p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false


def div_finder(num)
    divs = []
    (1..num).each do |div|
        if num % div == 0
            divs << num
        end
    end
    divs.length
end

def anti_prime?(num)
    (1...num).none? { |n| div_finder(n) >= div_finder(num)}
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

def matrix_addition(m1,m2)
    height = m1.length()
    width = m1[0].length()
    result_matrix = Array.new(height) {[0]* width}
    (0...height).each do |row|
        (0...width).each do |col|
            result_matrix[row][col] = m1[row][col] + m2[row][col]
        end
    end
    result_matrix
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


def factors(num)
    (1..num).select {|n| num % n == 0 }
end

def mutual_factors(*nums_arr)
    nums_arr.map { |num| factors(num)}.inject(:&)
end


p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    trib = [1,1,2]
    i = 3
    while i <= num - 1
        trib << trib[i-1] + trib[i-2] + trib[i-3]
        i += 1
    end
    trib[num - 1]
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274


def matrix_addition(m1,m2)
    height = m1.length()
    width = m1[0].length()
    result_matrix = Array.new(height) {[0]* width}
    (0...height).each do |row|
        (0...width).each do |col|
            result_matrix[row][col] = m1[row][col] + m2[row][col]
        end
    end
    result_matrix
end

def matrix_addition_reloaded(*matrices)
    matrix_0 = matrices[0]
    height = matrix_0.length
    width = matrix_0[0].length
    start_matrix = Array.new(height) {[0]* width}
    matrices.inject(start_matrix) do |m1, m2|
        return nil if m2.length != height || m2[0].length != width
        matrix_addition(m1, m2)
    end
end
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


def squarocol?(arr)
    col = arr[0].length()
    row = arr.length()

    arr.each do |subarr|
        return true if subarr.all? {|num| num == subarr[0]}
    end

    (0...col).each do |c|
        checker = []
        (0...row).each do |r|
            checker << arr[r][c]
        end
        return true if checker.all? {|num| num == checker[0]}
    end
    false

end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false


def pair_sum(arr)
    p_sums = []
    (0...arr.length-1).each do |i|
        p_sums << arr[i] + arr[i + 1]
    end
    p_sums
end

def pascals_triangle(n)
    f_arr = [[1]]
    while f_arr.length < n
        prev_lvl = f_arr[-1]
        curr_lvl = [1]
        curr_lvl += pair_sum(prev_lvl)
        curr_lvl += [1]
        f_arr << curr_lvl
    end
    f_arr
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]    
def prime?(num)
    return false if num < 2
    (2...num).none? {|n| num % n == 0 }
end

def mersenne_prime(num)
    mer_primes = []
    exp = 2
    while mer_primes.length < num
        if prime?((2 ** exp) - 1)
            mer_primes << 2**exp -1
        end
        exp += 1
    end
    mer_primes[-1]
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

def triangle?(num)
    (1...num).any? {|n| (n * (n+1))/2.0 == num}
end

def triangular_word?(str)
    sum = 0
    alpha = Array('a'..'z')
    str.each_char do |char|
        sum += alpha.index(char) + 1
    end
    triangle?(sum)
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

def collapser(arr)
    i = 0
    while i < arr.length
        if arr[i] + 1 == arr[i+1] || arr[i] - 1 == arr[i + 1]
            return arr[0...i] + arr[i+2..]
        end
        i += 1
    end
    arr
end

def consecutive_collapse(arr)
    while arr != collapser(arr)
        arr = collapser(arr)
    end
    arr
end


p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def prime?(num)
    return false if num < 2
    (2...num).none? {|n| num % n == 0 }
end

def greater_prime(ele, num)
    primes = []
    candidate = ele + 1
    while primes.length < num
        if prime?(candidate)
            primes << candidate
        end
        candidate += 1
    end
    primes[-1]
end

def lesser_prime(ele, num)
    primes = []
    candidate = ele - 1
    while primes.length < num.abs
        if prime?(candidate)
            primes << candidate
        elsif candidate < 2
            return nil
        end
        candidate -= 1
    end
    primes[-1]
end

def pretentious_primes(arr, num)
    arr.map do |ele|
        if num > 0
            greater_prime(ele, num)
        else
            lesser_prime(ele, num)
        end
    end
end


p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]