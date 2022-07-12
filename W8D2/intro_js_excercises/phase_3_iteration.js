Array.prototype.bubblesort = function() {
    sorted = false
    while (!sorted) {
        sorted = true
        for (i = 0; i < this.length; i++) {
            if (this[i] > this[i+1]) {
                sorted = false;
                let temp = this[i+1];
                this[i+1] = this[i];
                this[i] = temp;
            }
        }
    }
    return this
}
console.log([4,5,1,3].bubblesort());
console.log([7,2,1,8].bubblesort());

String.prototype.substrings = function() {
    var substrings = []
    for (i=0;i < this.length; i++) {
        for (j=0; j < this.length; j++) {
            if (j > i) {
                substrings.push(this.slice(i,j))
            }
        } 
    }
    return substrings
}
console.log("hello".substrings());
