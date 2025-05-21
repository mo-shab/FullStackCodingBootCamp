// Exercise 1 : Find the numbers divisible by 23

function displayNumbersDivisible() {
    isDivisible = "";
    sum = 0;
    for (let i = 0; i<= 500; i++) {
        if (i / 23 === 0) {
            isDivisible += i + " ";
            sum += i;
        }
    }

    console.log(`Outcome : ${isDivisible}`)
    console.log(`Sum : ${sum}`)
}
displayNumbersDivisible();

// Bonus, add paramerters to the function

function displayNumbersDivisible(divisor) {
    isDivisible = "";
    sum = 0;
    for (let i = 0; i <= 500; i++) {
        if (i / divisor === 0) {
            isDivisible += i + " ";
            sum += i;
        }
    }

    console.log(`Outcome : ${isDivisible}, Are divisible by ${divisor}`)
    console.log(`Sum : ${sum}`)
}
displayNumbersDivisible(25);
