def my_map(arr, &prc)
    f_arr = []
    arr.each do |num|
        f_arr << prc.call(num)
    end
    f_arr
end

def my_select(arr, &prc)
    f_arr = []
    arr.each do |ele|
        if prc.call(ele)
            f_arr << ele
        end
    end
    f_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    count
end

def my_any?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return true
        end
    end
    false
end

def my_all?(arr,&prc)
    arr.each do |ele|
        if !prc.call(ele)
            return false
        end
    end
    true
end
def my_none?(arr,&prc)
    arr.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    true
end
