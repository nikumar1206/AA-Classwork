def all_words_capitalized?(arr)
    arr.all? {|ele| ele[0].upcase + ele[1..].downcase== ele[0] + ele[1..]}
end


def no_valid_url?(arr)
    urls = ['.com', '.net', '.io', '.org']
    arr.none? {|url| urls.include?(url[-4..-1] || urls.include?(url[-3..-1]))}
end

def any_passing_students?(arr)
    arr.any? {|student| (student[:grades].sum)/(student[:grades].length) >= 75}
end
