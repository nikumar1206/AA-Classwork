def my_reject(arr, &prc)
    arr.select {|ele| !prc.call(ele)}
end

def my_one?(arr,&prc)
    (arr.select {|ele| prc.call(ele)}).length == 1
end

def hash_select(hash,&prc)
    n_hash = {}
    hash.each do |k, v|
        if prc.call(k, v)
            n_hash[k] = hash[k]
        end
    end
    n_hash 
end

def xor_select(arr, prc1, prc2)
    arr.select {|ele| prc1.call(ele) && !prc2.call(ele) || (!(prc1.call(ele)) && prc2.call(ele))}
end

def proc_count(val, arr)
    arr.count {|prc| prc.call(val)}
end
