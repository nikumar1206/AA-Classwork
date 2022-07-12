def anagrams1(s1,s2)
    substrings = s1.chars.permutation.to_a
    substrings.map!{|s|s.join}
    substrings.include?(s2)
end

def anagrams2(s1,s2)
    s1.each_char{|c|s2.delete!(c)}
    s2.empty?
end

def anagrams3(s1,s2)
    s1.chars.sort == s2.chars.sort
end

def anagrams4(s1,s2)
    h1 = Hash.new(0)
    h2 = Hash.new(0)
    s1.each_char{|c|h1[c] += 1}
    s2.each_char{|c|h2[c] += 1}
    h1 == h2
end

def anagrams5(s1,s2)
    h = Hash.new(0)
    s1.each_char{|c|h[c] += 1 if s2.include?(c)}
    h.keys.length == s1.length
end

p anagrams5("gizmo","sally")
p anagrams5("elvis","lives")
