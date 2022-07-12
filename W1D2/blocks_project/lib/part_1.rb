def select_even_nums(arr)
    arr.select {|num| num % 2 == 0}
end

def reject_puppies(arr)
    arr.reject {|hash| hash['age'] <= 2}
end

def count_positive_subarrays(arr)
    arr.count {|subarr| subarr.sum > 0}
end

def aba_translate(word)
    f_str = ''
    word.each_char do |char|
        if 'aeiou'.include?(char)
            f_str += char +'b' + char
        else
            f_str += char
        end
    end
    f_str
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end
