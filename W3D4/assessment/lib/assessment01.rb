class Array
#   # Write an `Array#my_inject` method. If my_inject receives no argument, then
#   # use the first element of the array as the default accumulator.
#   # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
#   # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift
    self.each do |ele|
      accumulator = prc.call(accumulator, ele)
    end
  accumulator
end


end
# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).none? {|int| num % int == 0 }
end

def primes(num)
  primes = []
  curr_num = 2
  while primes.length < num
    if is_prime?(curr_num)
      primes << curr_num
    end
    curr_num += 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.


def factorials_rec(num)
  return [1] if num <= 1
  return [1,1] if num == 2
  arr = factorials_rec(num-1)
  arr << (num-1) * arr[-1]
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h,k| h[k] = [] }
    self.each_with_index do |ele, i|
      if self.count(ele) > 1
        hash[ele] << i
      end
    end
    hash
  end
  
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings = []
    i = 0
    while i < self.length
      j = i
      while j < self.length
        substring = self[i..j]
        if j > i && self[i..j] == self[i..j].reverse && self[i..j].length > 1
          substrings << self[i..j]
        end
        j += 1
      end
      i += 1
    end
    substrings
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  def merge_sort(&prc)
    if self.length > 1
      mid_idx = self.length / 2
      left_arr = self.take(mid_idx)
      right_arr = self.drop(mid_idx)
      left_merg = left_arr.merge_sort(&prc)
      right_merg = right_arr.merge_sort(&prc)
      Array.merge(left_merg, right_merg, &prc)
    else
      return self
    end

  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    merged = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) <= -1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end
end
