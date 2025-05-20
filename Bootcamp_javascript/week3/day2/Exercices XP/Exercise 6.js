// Exercise 6 : Rudolf
const details = {
  my: 'name',
  is: 'Rudolf',
  the: 'reindeer'
}

 // console.log “my name is Rudolf the reindeer”
let str = '';
for (let key in details) {
  str += key + ' ' +details[key] + ' ';
}
console.log(`${str.trim()}`);
// Output: my name is Rudolf the reindeer