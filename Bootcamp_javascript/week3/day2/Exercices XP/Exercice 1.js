const people = ["Greg", "Mary", "Devon", "James"];

// Exercise 1 : List of people
// Part I - Review about arrays
// 1- Code to remove Greg from the array.
people.splice(0, 1);
console.log(people);

// 2 - Code to replace “James” to “Jason”.
people[2] = "Jason";
console.log(people);

// 3 - Code to add my name to the end of the array.
people.push("Mohammed");
console.log(people);

// 4 - Code that console.logs Mary’s index.
console.log(people.indexOf("Mary"));

// 5 - code to make a copy of the people array using the slice method.
    // . The copy should NOT include "Mary" or "Mohammed".
copyPoeple = people.slice(1, 3);

// 6 - Code that gives the index of “Foo”. Why does it return -1 ?
console.log(people.indexOf("Foo")); // -1 mean that "Foo" is not in the array

// 7 - Create a variable called last which value is the last element of the array.
let last = people[people.length - 1];
console.log(last);

// Part II - Loops
// 1 - Using a loop, iterate through the people array and console.log each person.
for (let i = 0; i < people.length; i++) {
  console.log(people[i]);
}

// 2 - Using a loop, iterate through the people array and exit the loop after you console.log “Devon” .
for (let i = 0; i < people.length; i++) {
  console.log(people[i]);
  if (people[i] === "Devon") {
    break;
  }
}