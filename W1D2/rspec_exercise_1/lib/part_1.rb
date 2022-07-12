def average(num1, num2)
    (num1+num2)/2
end
def average(num1,num2)
    (num1+num2)/2.0
end

def average_array(arr)
    sum = 0
    arr.each do |num|
        sum += num
    end
    sum /(arr.length).to_f()
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase() + '!'
end

def alternating_case(sentence)
    fstr = []
    sen_spl = sentence.split(' ')
    sen_spl.each_with_index do |word, i|
        if i % 2 == 0
            fstr << word.upcase
        else
            fstr << word.downcase
        end
    end
    fstr.join(' ')
end
p alternating_case('hello my name is')
