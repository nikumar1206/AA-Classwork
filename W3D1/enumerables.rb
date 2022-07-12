class Array

    def my_inject(accumulator = nil, &prc)
        accumulator ||= self.unshift
        self.each do |ele|
            accumulator = prc.call(accumulator, ele)
        end
        accumulator
    end

    def my_each(&block)
        i = 0
        while i < self.length
            block.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&block)
        f_arr = []
        self.my_each do |ele|
            f_arr << ele if block.call(ele)
        end
        f_arr
    end

    def my_reject(&block)
        my_select { |ele| !block.call(ele) }
    end

    def my_any?(&block)
        my_select {|ele| block.call(ele) }.length >= 1
    end

    def my_all?(&block)
        my_select {|ele| block.call(ele) }.length == self.length
    end

    def my_flatten
        return [self] if self.is_a?(Array)
        x = self.map { |arr| my_flatten(arr) }
        x.inject { |arr, el| arr + el}
    end

    def my_rotate(num=1)
        duplicate = self.dup
        if num > 0
            num.times {duplicate << duplicate.shift}
        else
            (-num).times { duplicate.unshift(duplicate.pop) }
        end
        duplicate
    end

    def my_join(separator = '')
        f_str = ''
        self.each do |char|
            char == self[-1] ? f_str += char : f_str += char + separator
        end
        f_str
    end

    def my_reverse
        i = -1
        new_arr = []
        while i >= -(self.length)
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end

    def my_zip(*other_arrs)
        zipped = []
        self.length.times do |i|
            subzip = [ self[i] ]
            other_arrs.each do |arr|
                subzip << arr[i]
            end
            zipped << subzip
        end
        zipped
    end

end
# calls my_each twice on the array, printing all the numbers twice.
# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
# end.my_each do |num|
#     puts num
# end
# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate        #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"


# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]