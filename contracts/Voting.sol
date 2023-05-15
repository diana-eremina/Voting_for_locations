pragma solidity >=0.4.22 <0.8.0;

contract Voting {
    address[16] public locations;
    // объявили переменную "locations". Указали ее тип и длину:
    // * Тип = address. (Solidity has a unique type called an address. It is array of Ethereum addresses)
    // * Длина этого массива составляет 16

    function vote(uint256 locationId) public returns (uint256) {
       // объявили функцию с названием vote
       // uint256 locationId = функция принимает на вход locationId, тип = uint256
       // returns (uint256) функция возвращает тоже тип uint256

        require(locationId >= 0 && locationId <= 15);
           // We use the require statement to ensure the ID is within range of our locations array.
           // У нас 16 локаций на сайте. При счете с нуля получаем 15.

        locations[locationId] = msg.sender;
          // Адрес вызывателя функции (проголосовавшего) добавляется в массив:
          // * msg.sender = address of the person or smart contract who called this function
          // * locations - массив, куда записывается это значение
          // locationId - айди локации, за которую проголосовали

        return locationId;
          // Finally, we return the locationId provided as a confirmation.
    }

    function getLocations() public view returns (address[16] memory) {
        return locations;

        // объявили функцию getLocations
        // 'view' means that the function will not modify the state of the contract.
        // 'return locations' - функция будет возвращать значение переменной location, которую объявляли ранее (the entire array)
        // 'address[16]' - уточняем тип возвращаемой переменной. the type for locations is address[16]
        // 'memory' - данная переменная относятся к числу тех, которые хранятся в memory

    }
}