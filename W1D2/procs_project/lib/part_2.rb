def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    f_arr = []
    sentence.split(' ').each do |word|
        f_arr << prc.call(word)
    end
    f_arr.join(' ')
end

def greater_proc_value(num, proc_1,proc_2)
    [proc_1.call(num), proc_2.call(num)].max()
end

def and_selector(arr, proc_1,proc_2)
    f_arr = []
    arr.each do |ele|
        if proc_1.call(ele) && proc_2.call(ele)
            f_arr << ele
        end
    end
    f_arr
end

def alternating_mapper(arr,proc_1,proc_2)
    f_arr = []
    arr.each_with_index do |ele, i|
        if i % 2 == 0
            f_arr << proc_1.call(ele)
        else
            f_arr << proc_2.call(ele)
        end
    end
    f_arr
end

