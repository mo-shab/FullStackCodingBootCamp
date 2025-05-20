// Exercise 5 : Family
// 1 -Create an object called family with a few key value pairs.
const family = {
    lastName: "Mohamed",
    firstName: "SHAB",
    age: 30,
    isMarried: false,
    children: [],
}

// 2 - Using a for in loop, console.log the keys of the object.
for (let key in family) {
    console.log(key);
}

// 3 - Using a for in loop, console.log the values of the object.
for (let key in family) {
    console.log(family[key]);
}