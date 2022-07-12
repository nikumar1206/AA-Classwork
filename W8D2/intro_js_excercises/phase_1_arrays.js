Array.prototype.uniq = function() {
    var new_arr = [];
    for (i = 0; i < this.length; i++) {
        if (!new_arr.includes(this[i])) {
            new_arr.push(this[i]);
        }
    }
    return new_arr
};

console.log([1,2,2,3,3,3].uniq())

Array.prototype.twosum = function() {
    let pos_pairs = [];
    let counter_hash = {};
    for (let i=0; i < this.length; i++) {
        let target = (0 - this[i])
        counter_hash[this[i]] = i
        if (target in counter_hash) {
            pos_pairs.push([counter_hash[target],i])

        }
    }
    return pos_pairs
};
console.log([5,4,2,-1,-2].twosum())

Array.prototype.transpose = function() {
    let rows = this.length;
    let columns = this[0].length;
    let transposed = [];
    let i = 0;
    while (i < rows) {
        let row = [];
        let j = 0;
        while (j < columns) {
            row.push(this[j][i]);
            j++;
        }
        transposed.push(row);
        i++;
    }
    return transposed
};
var T = [ [12, 5, 2], [15, 6, 10], [8, 12, 5] ]
console.log(T.transpose())
