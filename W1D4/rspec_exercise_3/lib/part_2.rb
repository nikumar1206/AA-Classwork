def element_count(arr)
    counter = Hash.new(0)
    arr.each do |ele|
        counter[ele] += 1
    end
    counter
end

def char_replace!(str,hash)
    str.each_char.with_index do |char, i|
        if hash.include?(char)
            str[i] = hash[char]
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|acc, el| acc * el}
end
