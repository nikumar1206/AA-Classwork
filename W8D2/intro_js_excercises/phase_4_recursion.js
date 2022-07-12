const range = (start, end) => {
    if (end-start == 0) {
        return [start]
    }
    return [start].concat(range(start+1,end))
}
console.log(range(3,6));

const sumRec = (arr) => {
    if (arr.length <= 1) {
        return arr[0];
    } else {
        return arr[0] + sumRec(arr.slice(1));
    }
}
console.log(sumRec([4,5,1]));

const exponent1 = (base, exp) => {
    return exp == 1 ? base : base * exponent1(base, exp-1);
};
console.log(exponent1(2,3));

const exponent2 = (base, exp) => {
    if (exp % 2 == 0) {
        if (exp == 1) {
            return base;
        } else {
            return exponent2(base, exp / 2) ** 2;
        }
    } else {
        if (exp == 1) {
            return base;
        } else {
            return base * (exponent2(base, (exp - 1) / 2) ** 2);
        }
    }
};
console.log(exponent2(2,3));

const fibonacci = (n) => {
    let fibs = [0,1]
    if (n == 1) {
        return [fibs[0]];
    } else if (n == 2) {
        return fibs;
    } else {
        return fibonacci(n - 1).concat( [ fibonacci(n-1).slice(-1)[0] + fibonacci(n-1).slice(-2)[0] ] )
    }
}
console.log(fibonacci(10));

const deepdup = function(arr) {
    if (!(arr instanceof Array)) {
        return [arr]
    }
    let dupped = []
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] instanceof Array) {
            dupped.push(arr[i])
        } else {
            dupped.push(arr[i])
        }
    }
    return dupped
};
// const deepDup = (arr) => {
//     if (!Array.isArray(arr)) return arr;
//     return arr.map((el) => {
//         return deepDup(el);
//     });
// }
console.log(deepdup([1,2,3]));
console.log(deepdup([[1,2],[3, 4],[5, 6]]));

const bsearch = (arr, target) => {
    if (arr.length <= 1 && arr[0] !== target) {
        return -1
    }
    let mid_idx = Math.floor(arr.length / 2)
    if (target === arr[mid_idx]) {
        return mid_idx
    } else if (target > arr[mid_idx]) {
        x = bsearch((arr.slice(mid_idx+1)), target)
        return x + mid_idx + 1
    } else {
        return bsearch((arr.slice(0,mid_idx)), target)
    }
};
console.log(bsearch([1,3,5,6,10], 5));
console.log(bsearch([1,2,4,6,7,12,14], 12));

const mergesort = (arr) => {
    if (arr.length === 1) {
        return arr;
    }
    let mid_idx = Math.floor(arr.length / 2);
    let left_arr = arr.slice(0,mid_idx);
    let right_arr = arr.slice(mid_idx);
    let left_merged = mergesort(left_arr);
    let right_merged = mergesort(right_arr);
    return merge(left_merged, right_merged)
}

const merge = (l_arr, r_arr) => {
    let merged = []
    while (l_arr.length && r_arr.length) {
        if (l_arr[0] < r_arr[0]) {
            merged.push( l_arr.shift() )
        }
        else {
            merged.push( r_arr.shift() )
        }
    }
    return merged.concat( l_arr, r_arr)
}
console.log(mergesort([5,4,3,6,8]));

const subsets = (arr) => {
    if (arr.length === 0) return [[]];
    let first = arr[0]
    let withoutfirst = subsets(arr.slice(1))
    let withFirst = withoutfirst.map(sub => [first].concat(sub));
    return withoutfirst.concat(withFirst);
};
console.table(subsets([1,2,3,4,5]));
