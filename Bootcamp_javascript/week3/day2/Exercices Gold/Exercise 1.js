// Exercise 1 : Divisible by three

let numbers = [123, 8409, 100053, 333333333, 7]


// 1 - Loop through the array above and determine if the number is divisible by three.

for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 3 === 0) {
        console.log(`${numbers[i]} is divisible by 3`);
    } else {
        console.log(`${numbers[i]} is not divisible by 3`);
    }
}