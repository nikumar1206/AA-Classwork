def longest_streak(string):
    streak = ''
    i = 0
    while i < len(string):
        j = i
        while j < len(string):
            if len(string[i:j+1]) >= len(streak) and string[i] == string[j]:
                streak = string[i:j+1]
            j += 1
        i += 1
    return streak


print(longest_streak('a'))           # => 'a'
print(longest_streak('accccbbb'))    # => 'cccc'
print(longest_streak('aaaxyyyyyzz')) # => 'yyyyy
print(longest_streak('aaabbb'))      # => 'bbb'
print(longest_streak('abc'))         # => 'c'


def vigenere_cipher(string, keys):
    f_str = ''
    alpha = 'abcdefghijklmnopqrstuvwxyz'
    for i in range(0,len(string)):
        change = keys[i % len(keys)]
        new_i = (alpha.index(string[i]) + change) % 26
        f_str += alpha[new_i]
    return f_str

print(vigenere_cipher("toerrishuman", [1]))        # => "upfssjtivnbo"
print(vigenere_cipher("toerrishuman", [1, 2]))     # => "uqftsktjvobp"
print(vigenere_cipher("toerrishuman", [1, 2, 3]))  # => "uqhstltjxncq"
print(vigenere_cipher("zebra", [3, 0]))            # => "ceerd"
print(vigenere_cipher("yawn", [5, 1]))             # => "dbbo"
