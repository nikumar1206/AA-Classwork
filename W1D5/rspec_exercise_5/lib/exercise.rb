def zip(*arrs)
    (0...arrs[0].length).map { |i| arrs.map{ |array| array[i] } }
end


def prizz_proc(arr, prc1, prc2)
    arr.select {|ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))}
end

def zany_zip(*arrs)
    arr_max = 0
    arrs.each do |array|
        if array.length > arr_max
            arr_max = array.length
        end
    end

    (0...arr_max).map {|i|
        arrs.map { |array| 
            array[i]
        }
    }
end

def maximum(arr, &prc)
    max = -2**32
    ement = nil
    arr.each do |ele|
        if prc.call(ele) >= max
            max = prc.call(ele)
            ement = ele
        end
    end
    ement
end

def my_group_by(arr, &prc)
    hash = {}
    arr.each do |ele|
        if hash.include?(prc.call(ele))
            hash[prc.call(ele)] << ele
        else
            hash[prc.call(ele)] = [ele]
        end
    end
    hash
end

def max_tie_breaker(arr, prc, &block)
    max_ele = arr[0]
    arr.each do |ele|
        if block.call(ele) > block.call(max_ele)
            max_ele = ele
        elsif
            block.call(ele) == block.call(max_ele) && prc.call(ele) > prc.call(max_ele)
            max_ele = ele
        end
    end
    max_ele
end

def vowel_counter(word)
    count = 0
    word.each_char do |char|
        if 'aeiouAEIOU'.include?(char)
            count += 1
        end
    end
    count
end

def l_vow(word)
    rev_word = word.reverse
    rev_word.each_char.with_index do |char, i|
        if 'AEIOUaeiou'.include?(char)
            return word.length-1 - i
        end
    end
end

def f_vow(word)
    word.each_char.with_index do |char, i|
        if 'AEIOUaeiou'.include?(char)
            return i
        end
    end
end

            
def silly_syllables(sentence)
    sen_spl = sentence.split(' ')
    f_arr = []
    sen_spl.each do |word|
        if vowel_counter(word) < 2
            f_arr << word
        else
            f_arr << word[f_vow(word)..l_vow(word)]
        end
    end
    f_arr.join(' ')
end


