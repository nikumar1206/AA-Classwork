# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    return self.max - self.min
  end

  def average
    return nil if self.empty?
    return self.sum/self.length.to_f
  end

  def median
    return nil if self.empty?
    sort = self.sort
    middle = sort.length / 2
    sort.length % 2 == 0 ? (sort[middle - 1] + sort[middle]) / 2.0 : sort[middle]
  end

  def counts
    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash
  end

  def my_count(val)
    counter = 0
    self.each do |ele|
        if ele == val
            counter += 1
        end
    end
    counter
  end

  def my_index(val)
    self.each_with_index do |ele, i|
        if ele == val
            return i
        end
    end
    nil
  end

  def my_uniq
    arr = []
    self.each do |ele|
        if !(arr.include?(ele))
            arr << ele
        end
    end
    arr
  end

  def my_transpose
    f_arr = []
    self.each_with_index do |arr, i|
        row = []
        self.each_with_index do |arr2, j|
            row << self[j][i]
        end
        f_arr << row
    end
    f_arr
  end
end

