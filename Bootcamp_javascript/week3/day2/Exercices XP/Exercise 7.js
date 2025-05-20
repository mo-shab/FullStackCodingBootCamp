// Exercise 7 : Secret Group

const names = ["Jack", "Philip", "Sarah", "Amanda", "Bernard", "Kyle"];

// A group of friends have decided to start a secret society.
// The society’s name will be the first letter of each of their names sorted in alphabetical order.
const sortedNames = names.sort();
let secretScocietyName = '';
for (let i = 0; i < sortedNames.length; i++) {
    secretScocietyName += sortedNames[i][0];
}
// Output: "ABJKPS"
console.log(secretScocietyName);