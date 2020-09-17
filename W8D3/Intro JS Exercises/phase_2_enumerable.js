// ruby:
// arr.each do |el, idx|
//     el * 2
// end

// javascript:
// arr.forEach(function(el, idx) {
//     el * 2;
// })
//optional idx

Array.prototype.myEach = function(callback) {
    for(let i = 0; i < this.length; i++) {
        callback(this[i]);
    };
};

function doubler(el) {
    return el * 2
};

// console.log([1,2,3,4,5].myEach(doubler));
// same as saying:
// console.log([1,2,3,4,5].myEach( function (el) {
//     return el * 2;
// }));

Array.prototype.myMap = function (callback) {
    let arr = [];
    this.myEach(function(el) {
        arr.push(callback(el));
    })
    return arr;
};

// console.log([1, 2, 3, 4, 5].myMap(doubler));

Array.prototype.myReduce = function (callback, initialValue) {
    let newArr = this
    let acc

    if (initialValue) {
        acc = initialValue; //can't use let here because we can't access it outside the block, so we declare it outside
    }
    else {
        acc = this[0];
        newArr = newArr.slice(1)
    }

    newArr.myEach(el => acc = callback(acc, el)); //el here is like |el| in ruby

    return acc;
}

console.log([1, 2, 3].myReduce(function (acc, el) {return acc + el;})); 
// console.log([1, 2, 3].myReduce((acc, el) => {return acc + el;})); 

console.log([1, 2, 3].myReduce(function (acc, el) {
    return acc + el;
}, 25));