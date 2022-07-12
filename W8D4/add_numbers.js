// const { stdin } = require('process');
// const { read } = require('fs');
const readline = require('readline')
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


const addNumbers = (sum, numsLeft, completioncallBack) => {
    if (numsLeft > 0) {
        reader.question("Gimme a number:  ", (res) => {
            let num = parseInt(res);
            sum += num
            completioncallBack(sum);
            addNumbers(sum, numsLeft-1, completioncallBack)
        });
    } else {
        completioncallBack(sum)
    }
}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));







