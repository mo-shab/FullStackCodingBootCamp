// Exercise 2 : Shopping List

// 1 - Add objects stock and prices
const stock = { 
    "banana": 6, 
    "apple": 0,
    "pear": 12,
    "orange": 32,
    "blueberry":1
}  

const prices = {    
    "banana": 4, 
    "apple": 2, 
    "pear": 1,
    "orange": 1.5,
    "blueberry":10
}

// 2 - Create array with some items

let shoppingList = ["banana", "orange", "apple"];

// 3 - function myBill

function myBill() {
    let total = 0;
    for (let i = 0; i < shoppingList.length; i++) {
        let item = shoppingList[i];
        if (stock[item] < 0) {
            total += prices[item];
        } else {
            console.log(`${item} is out of stock`);
        }
    }
    
    return total;
}

console.log(myBill());