// create an array called allBooks. This is an array of objects. Each object is a book that has 4 keys (ie. 4 properties) :
// title, author, image, alreadyRead


allBooks = [
    {
        title : "Harry Potter and the Sorcerer's Stone",
        author : "JJK Rowling",
        image : "https://images.isbndb.com/covers/3705483482822.jpg",
        alreadyRead : false,
    },
    {
        title : "One Piece",
        author : "Eiichiro Oda",
        image : "https://images.isbndb.com/covers/2168113482891.jpg",
        alreadyRead : true,
    }
];

console.log(allBooks[0].title);

// Render each book inside a div inside the section
// WE have to display the book's title like this : HarryPotter written by JKRolling
// The width of the image has to be set to 100px
// if the book is already read, color of the book's details to red

section = document.querySelector("section");
for (let i = 0; i < allBooks.length; i++) {
    const book = allBooks[i];
    const div = document.createElement("div");
    div.classList.add("book");
    div.innerHTML = `<h2>${book.title} written by ${book.author}</h2>`;
    const img = document.createElement("img");
    img.src = book.image;
    img.style.width = "100px";
    div.appendChild(img);
    section.appendChild(div);

    if (book.alreadyRead) {
        div.style.color = "red";
    }
}