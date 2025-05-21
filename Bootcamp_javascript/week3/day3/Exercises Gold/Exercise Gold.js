// Exercise 1 : is_Blank
// Function to check if a string is blank
function isBlank(str) {
    return str() === '';
}

// Exercise 2 : Abbrev_name

function abbrevName(name) {
    const names = name.split(' ');
    return names[0] + names[1][0].toUpperCase() + '.';
}

console.log(abbrevName("Robin Singh"));

// Exercise 3 : swapCase

function swapCase(str) {
    let result = '';
    for (let i = 0; i < str.length; i++) {
        const char = str[i];
        if (char !== char.toUpperCase()) {
            result += char.toLowerCase();
        } else {
            result += char.toUpperCase();
        }
    }
    return result;
}

console.log(swapCase("The Quick Brown Fox"));

// Exercise 4 : Omnipresent value

function isOmnipresent(arr, value) {
    for (let i = 0; i < arr.length; i++) {
        if (!arr[i](value)) {
            return false;
        }
    }
    return true;
}

console.log(isOmnipresent([[1, 1], [1, 3], [5, 1], [6, 1]], 1));
console.log(isOmnipresent([[1, 1], [1, 3], [5, 1], [6, 1]], 6));
