def partition(arr, num)
    f_arr = []
    f_arr[0] = arr.select {|ele| ele < num }
    f_arr[1] = arr.select {|ele| ele >= num}
    f_arr
end

def merge(hash1, hash2)
    f_hash = Hash.new(0)
    hash1.each do |k,v|
        f_hash[k] = v
    end

    hash2.each do |k, v|
        f_hash[k] = v
    end
    f_hash
end

def vowel_rep(word)
    vowels= 'aeiouAEIOU'
    fix_word = ''
    word.each_char do |char|
        if vowels.include?(char)
            fix_word += '*'
        else
            fix_word += char
        end
    end
    fix_word
end


def censor(sentence, arr)
    f_arr = []
    sen_spl =sentence.split(' ')
    sen_spl.each do |word|
        if arr.include?(word.upcase) || arr.include?(word.downcase)
            f_arr << vowel_rep(word)
        else
            f_arr << word
        end
    end
    f_arr.join(' ')
end

def power_of_two?(num)
    return true if num == 1
    while num > 2
        num = num / 2.0
    end
    num % 2 == 0
end
