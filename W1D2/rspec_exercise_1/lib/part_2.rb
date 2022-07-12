def hipsterfy(word)
    vowels= 'aeiou'
    rev_word = word.reverse
    rev_word.each_char.each_with_index do |char, i|
        if vowels.include?(char)
            rev_word = rev_word[0...i] + rev_word[i+1..]
            return rev_word.reverse
        end
    end
    return word
end

def vowel_counts(str)
    vowels = 'aeiouAEIOU'
    counter = Hash.new(0)
    str.each_char do |char|
        if vowels.include?(char)
            counter[char.downcase] += 1
        end
    end
    counter
end

def caesar_cipher(msg,num)
    alpha = 'abcdefghijklmnopqrstuvwxyz'
    fstr = ''
    msg.each_char do |char|
        if alpha.include?(char)
            fstr += alpha[(alpha.index(char) + num) % 26]
        else
            fstr += char
        end
    end
    fstr
end
