const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myEach = function(func) {
    for (let i = 0;i < this.length; i ++) {
        func(this[i]);
    }
};

Array.prototype.myMap = function(func) {
    var mapped_arr = [];
    this.myEach(element => mapped_arr.push(func(element)));
    return mapped_arr;
};
function multiplier(el) {
    return el * 2
}
console.log(NUMS.myMap(multiplier));

Array.prototype.myReduce = function(func, val = null) {
    let new_arr = this
    if (val === null) {
        var acc = new_arr.shift()
    } else {
        var acc = val
    }
    new_arr.myEach(element => acc = func(acc, element))
    return acc
};
console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
}))
