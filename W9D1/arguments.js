//sum

function sum1() {
    let sum = 0;

    let args = Array.from(arguments);

    args.forEach(num => sum += num);
    return sum;
}

function sum2(...args) {
    let sum = 0;
    args.forEach(num => sum += num);
    return sum;
}

// console.log(sum1(1, 2, 3, 4) === 10);
// console.log(sum1(1, 2, 3, 4, 5) === 15);

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

//myBind
//myBind is set on the function prototype

Function.prototype.myBind1 = function(context){
    let that = this;
    let first_arguments = Array.from(arguments).slice(1);
    return function() {
        let all_arguments = first_arguments.concat(Array.from(arguments));
        return that.apply(context, all_arguments);
    };

    //ES 6: no that = this
    // return () => {
    //     return this.apply(context, all_arguments)
    // }
    // don't use fat arrow for myBind for prac assessment
}

Function.prototype.myBind = function(context, ...args1) {
    let that = this;
    return function(...args2) {
        let all_arguments = args1.concat(args2);
        return that.apply(context, all_arguments);
        //return that.apply(context, ...all_arguments)
    }
}

//ES6: 
// Function.prototype.myBind = function (context, ...args1) {
//     return (...args2) => {
//         let all_arguments = args1.concat(args2);
//         return this.apply(context, all_arguments);
//     }
// }

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

// console.log(markov.says); => points to function, does not invoke it
 
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

//curriedSum

function curriedSum(numArgs) {
    let numbers = [];
    return curried_sum = function (add_this_number) {
        numbers.push(add_this_number);
        if(numbers.length === numArgs)  { //sum up all the numbers inside 'numbers'
            let sum = 0;
            numbers.forEach(el => sum += el);
            return sum;
        } else { //return a reference to the same function
            return curried_sum;
        }
    };
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56


//Function.prototype.curry

Function.prototype.curry1 = function (numArgs) {
    let stars = [];
    let that = this;
    return curried_function = function(bit) {
        debugger;
        stars.push(bit);
        if (stars.length === numArgs) {
                //find our context function ('that'?)
            return that.apply(this, stars) //this can be anything (null)
        } else {
            return curried_function;
        }
    };
};

Function.prototype.curry = function (numArgs) {
    let stars = [];
    let that = this;
    return curried_function = function(bit) {
        stars.push(bit);
        if(stars.length === numArgs) {
            return that(...stars);
        } else {
            return curried_function;
        }
    };
}

function multiply(...args) {
    let total = 1;
    args.forEach(el => total *= el);
    return total;
}

console.log(multiply.curry(4)(2)(3)(4)(5))