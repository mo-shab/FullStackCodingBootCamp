// Exercise 4 : Building Management

const building = {
    numberOfFloors: 4,
    numberOfAptByFloor: {
        firstFloor: 3,
        secondFloor: 4,
        thirdFloor: 9,
        fourthFloor: 2,
    },
    nameOfTenants: ["Sarah", "Dan", "David"],
    numberOfRoomsAndRent:  {
        sarah: [3, 990],
        dan:  [4, 1000],
        david: [1, 500],
    },
}

// Console.log the number of floors in the building.
console.log((`The number of floors in the building is ${building.numberOfFloors}`));

// Console.log how many apartments are on the floors 1 and 3
console.log((`The number of appartments in 1st floor is ${building.numberOfAptByFloor.firstFloor} \
and in 3rd floor is ${building.numberOfAptByFloor.thirdFloor}.`));

// Console.log the name of the second tenant and the number of rooms he has in his apartment.
console.log(`The Name of the second tenant is : ${building.nameOfTenants[1]}, And he has \
${building.numberOfRoomsAndRent.dan[0]} rooms in his apartment.`);

// Check if the sum of Sarah’s and David’s rent is bigger than Dan’s rent. If it is, than increase Dan’s rent to 1200.
if ((building.numberOfRoomsAndRent.sarah[1] + building.numberOfRoomsAndRent.david[1]) > building.numberOfRoomsAndRent.dan[1]) {
    building.numberOfRoomsAndRent.dan[1] = 1200;
    console.log(`Dan's rent has been increased to ${building.numberOfRoomsAndRent.dan[1]}.`);
}