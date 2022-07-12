class Array
    def my_uniq
        counter = Hash.new(0)
        self.each { |ele| counter[ele] += 1 }
        counter.keys
    end

    def two_sum
        final_arr = []
        self.each_with_index do |num, i|
            target = 0 - num
            if self.include?(target) && self.index(target) > i
                final_arr << [i, self.index(target)]
            end
        end
        final_arr
    end

    def my_transpose
        collect = []
        (0...self.length).each do |row|
            mini = []
            (0...self.length).each do |col|
                mini << self[col][row]
            end
            collect << mini
        end

        collect
    end
end

def my_transpose(arr)
    collect = []
    (0...arr.length).each do |row|
        mini = []
        (0...arr.length).each do |col|
            mini << arr[col][row]
        end
        collect << mini
    end
    collect
end
=begin
Stock Picker
Write a method that takes an array of stock prices (prices on days 0, 1, ...), 
and outputs the most profitable pair of days on which to first buy the stock and 
then sell the stock. Remember, you can't sell stock before you buy it!
=end

def stock_picker(stocks) 
    profits = Hash.new {|h,k| h[k] = []}
    stocks.each_with_index do |ele1,i|
        stocks.each_with_index do |ele2,j|
            if j > i && !profits.include?(ele2-ele1)
                profits[ele2-ele1].push(i, j)
            end
        end
    end
    profits[profits.keys.max]
end

p stock_picker([7,1,5,3,6,4])
p stock_picker([7,6,4,3,1])

p [1, 2, 1, 3, 3].my_uniq

p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]

p my_transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ])


