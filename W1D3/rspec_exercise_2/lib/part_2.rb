def palindrome?(str)
    i = -1
    rev_str = ''
    while i >= -str.length()
        rev_str += str[i]
        i -= 1
    end
    rev_str == str
end

def substrings(str)
    f_arr = []
    i = 0
    while i < str.length
        j = i
        while j < str.length
            substr = str[i..j]
            if !(f_arr.include?(substr))
                f_arr << substr
            end
            j += 1
        end
        i += 1
    end
    f_arr
end

def palindrome_substrings(str)
    f_arr = []
    substrings(str).each do |substr|
        if palindrome?(substr) && substr.length > 1
            f_arr << substr
        end
    end
    f_arr
end

