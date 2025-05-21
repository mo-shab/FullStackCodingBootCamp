const div = document.getElementsById("container");
console.log(div)

// Change peter to "Richard"
const list = document.getElementName("li");
list[1].innerHTML = "Richard";


// delete the second <li> of the second <ul>
const ul = document.getElementName("ul");
ul[1].removeChild(ul[1].getElementsByTagName("li")[1]);

// change the name of the firt <li> of each <ul>
for (const i = 0; i < ul.length; i++) {
    ul[i].getElementsByTagName("il")[0].innerHTML = "Name";
}

// Add class "student_list" to each <ul>
for (let i = 0; i < ul.length; i++) {
    ul[i].classlist.add("student_list");
}

// add class university and attendance to the first <ul>
ul[0].classList.add("university", "attendance");

// add "light blue"" background color and some padding to the div
div.style.backgroundColor = "lightblue";
div.style.padding = "20px";

// do not display the li that contains the text node "Dan"
for (let i = 0; i < list.length; i++) {
    if (list[i].innerHTML === "Dan") {
        list[i].style.display = "none";
    }
}

//add border to li that contain richard
for (let i = 0; i < list.length; i++) {
    if (list[i].innerHTML === "Richard") {
        list[i].style.border = "1px solid black";
    }
}

//Bonus : if the div have background color "lightblue" alert "Hello"
if (div.style.backgroundColor === "lightblue") {
    alert("Hello");
}