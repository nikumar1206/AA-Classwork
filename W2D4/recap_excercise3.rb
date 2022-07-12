def no_dupes?(arr)
    arr.select {|ele| !(arr.count(ele) > 1)}
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each_with_index do |num, i|
        if num == arr[i + 1]
            return false
        end
    end
    true
end
# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    index_counter = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index {|char, i| index_counter[char] << i}
    index_counter
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    arr = str.split('')
    i = 0
    streak = ''
    while i < arr.length
        j = i
        while j < arr.length
            if arr[i..j].uniq.length == 1 && arr[i..j].length >= streak.length
                streak = arr[i..j]
            end
            j += 1
        end
        i += 1
    end
    streak.join('')
end
# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def prime?(num)
    return false if num < 2
    (2...num).none? { |ele| num % ele == 0 }
end

def bi_prime?(num)
    (2...num/2).any? { |fac1| target = (num * 1.0) / fac1
        prime?(fac1) && prime?(target) && num % fac1 == 0
    }
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false


def vigenere_cipher(str, keys)
    alpha = ('a'..'z').to_a
    str.each_char.with_index do |char, i|
        change = keys[i % keys.length]
        new_idx = (alpha.index(char) + change) % 26
        str[i] = alpha[new_idx]
    end
    str
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_arr(str)
    arr = str.split('').select {|char| 'aeiou'.include?(char)}
    arr.unshift(arr.pop)
    arr
end

def vowel_rotate(str)
    j = 0
    arr = vowel_arr(str)
    str.each_char.with_index do |char, i|
        if 'aeiou'.include?(char)
            str[i] = arr[j]
            j += 1
        end
    end
    str
end
# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"


class String
    def select(&block)
        block ||= Proc.new {|char| char == nil?}
        f_str = ''
        self.each_char do |char|
            if block.call(char)
                f_str += char
            end
        end
        f_str
    end

    def map!(&block)
        block ||= Proc.new{ |char| char }
        self.each_char.with_index do |char, i|
            self[i] = block.call(char, i)
        end
    end
end
# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"