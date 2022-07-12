function sum() {
    let sumz = 0;
    for (i = 0; i < arguments.length; i++) {
        sumz += arguments[i]
    }
    return sumz
}
// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);


function sum2(...args) {
    let sumz = 0
    for (i = 0; i < args.length; i++) {
        sumz += args[i]
    }
    return sumz
}
// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);


Function.prototype.myBind = function(context) {
    let that = this;
    // const bindArgs = context
    let call_args_outer = Array.from(arguments).slice(1)
    return function() {
        let call_args = call_args_outer.concat(Array.from(arguments));
        return that.apply(context, call_args)
    }
    
};

class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");
  
  markov.says("meow", "Ned");
  // Markov says meow to Ned!
  // true
  
  // bind time args are "meow" and "Kush", no call time args
  markov.says.myBind(pavlov, "meow", "Kush")();
  // Pavlov says meow to Kush!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "a tree"
  markov.says.myBind(pavlov)("meow", "a tree");
  // Pavlov says meow to a tree!
  // true
  
  // bind time arg is "meow", call time arg is "Markov"
  markov.says.myBind(pavlov, "meow")("Markov");
  // Pavlov says meow to Markov!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "me"
  const notMarkovSays = markov.says.myBind(pavlov);
  notMarkovSays("meow", "me");
  // Pavlov says meow to me!
  // true


function curriedSum(numArgs) {
    let numbers = [];

    return function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return numbers.reduce((acc, next) => acc + next, 0);
        } else {
            return _curriedSum;
        }
    }
};
// const sumz = curriedSum(3);
// console.log(sumz(2)(3)(10));


Function.prototype.curry = function(numArgs) {
    let that = this;
    let numbers = [];

    return function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return that.call(that, ...numbers);
        } else {
            return _curriedSum;
        }
    }
};

Function.prototype.curry2 = function(numArgs) {
    let that = this;
    let numbers = [];

    return function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return that.apply(that, numbers);
        } else {
            return _curriedSum;
        }
    }
};

console.log(sum.curry2(2)(2)(3));
console.log(sum.curry2(4)(2)(3)(5)(10));