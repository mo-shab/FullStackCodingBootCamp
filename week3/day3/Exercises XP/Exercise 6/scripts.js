// Change the navBar to socialNetwrokNavigation
const navBar = document.getElementById("navBar");
navBar.classList.remove("navBar");
navBar.classList.add("socialNetworkNavigation");

// Create li

const li = document.createElement("li");
// Append the text node to the newly created list node (<li>).
// Create a text node
const textNode = document.createTextNode("Logout");
li.appendChild(textNode);
// Append the li to the ul
const ul = document.querySelector("ul");
ul.appendChild(li);

// firstElementChild and lastElementChild to retrieve the first and last <li> of the <ul>
const firstLi = ul.firstElementChild;
const lastLi = ul.lastElementChild;

// display the text of the first and last <li>, hint use textContent
console.log(firstLi.textContent);
console.log(lastLi.textContent);