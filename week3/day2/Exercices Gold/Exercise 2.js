// Exercise 2 : Attendance

let guestList = {
  randy: "Germany",
  karla: "France",
  wendy: "Japan",
  norman: "England",
  sam: "Argentina"
}

// 1 - Prompt the student for their name.
let name = prompt("What is your name?").toLowerCase();

if (name in guestList) {
  // 2 - Check if the name exists in the guest list.
  console.log(`Hi! I'm ${name}, and I'm from ${guestList[name]}`);
}   else {
    // 3 - If the name doesn't exist, console.log "Hi! I'm a guest".
    console.log(`Hi! I'm a guest`);
}