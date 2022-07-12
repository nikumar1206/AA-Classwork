# Define your methods here.
def my_map!(arr, &block)
    arr.each_with_index do |ele, i|
        arr[i] = block.call(ele)
    end
    arr
end

def two?(arr, &block)
    count = 0
    arr.each do |ele|
        if block.call(ele)
            count += 1
        end
    end
    count == 2
end

def nor_select(arr, prc1, prc2)
    arr.select {|ele| !(prc1.call(ele)) && !(prc2.call(ele)) }
end

def array_of_hash_sum(arr)
    sum = 0
    arr.each do |hash|
        hash.each do |k, v|
            sum += v
        end
    end
    sum
end
def vowel_remover(word)
    word.each_char.with_index do |char, i|
        if 'AEIOUaeiou'.include?(char)
            return word[0...i] + word[i+1..]
        end
    end
end

def slangify(sentence)
    f_str = []
    sen_spl = sentence.split(' ')
    sen_spl.each do |word|
        f_str << vowel_remover(word)
    end
    f_str.join(' ')
end

def char_counter(string, *args)
    if args.length == 0
        args = string.split('').uniq
    end
    n_hash = {}
    args.each do |char|
        n_hash[char] = string.count(char)
    end
    n_hash
end

