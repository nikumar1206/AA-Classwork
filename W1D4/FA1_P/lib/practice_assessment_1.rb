# Define your methods here. 
def first_letter_vowel_count(sentence)
    sen_spl = sentence.split(' ')
    count = 0
    sen_spl.each do |word|
        if 'aeiouAEIOU'.include?(word[0])
            count += 1
        end
    end
    count
end

def count_true(arr, prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count
end

def procformation(arr,prc1,prc2,prc3)
    f_arr = []
    arr.each do |ele|
        if prc1.call(ele)
            f_arr << prc2.call(ele)
        else
            f_arr << prc3.call(ele)
        end
    end
    f_arr
end

def array_of_array_sum(arr)
    flat = arr.flatten()
    flat.sum()
end

def selective_reverse(sentence)
    f_arr = []
    sen_spl = sentence.split(' ')
    sen_spl.each do |word|
        if 'aeiou'.include?(word[0]) || 'aeiou'.include?(word[-1])
            f_arr << word
        else
            f_arr << word.reverse!
        end
    end
    f_arr.join(' ')
end

def hash_missing_keys(hash, *args)
    f_arr = []
    args.each do |ele|
        if !(hash.include?(ele))
            f_arr << ele
        end
    end
    f_arr
end
