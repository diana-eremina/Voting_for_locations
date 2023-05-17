pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
  // These first two imports are referring to global Truffle files, not a Truffle directory.
  // Assert.sol gives us various assertions to using in our tests
  // truffle/DeployedAddresses.sol will deploy a fresh instance of the contract being tested to the blockchain (Voting.sol)

import "../contracts/Voting.sol";
  // the smart contract we want you to test

contract TestVoting {
    Voting voting = Voting(DeployedAddresses.Voting());
      // we need to initiate the Voting contract to the deployed contract
      // This will be used to call the functions inside of Voting contracts.
      // * Voting - это название файла, где лежит функция, и название контракта
      // * vote - это название функции в этом файле.

    uint256 expectedLocationId = 8;
      // Объявили перемнную expectedLocationId с типом uint256 и значением  8
      // (Тест будет голосовать за локацию с id=8)

    address expectedVotedLocation = address(this);
      // This will return the address of the voted location.
      // earlier we set the ID of the location that we are going to test (expectedLocationId)
      // And now we are just setting what is the address of this location in the blockchain.
      // пока не поняла, откуда система поймет какой адрес надо брать, что такое "address(this)" ?

// Test Function #1 - глосуем за локацию
    function testUserCanVoteLocation() public {
        // объявили тестовую функцию

        uint256 returnedId = voting.vote(expectedLocationId);
            // uint256 returnedId - объявили переменную returnedId
            // положили в эту переменную то, что возвращает функция vote
            // (функция возвратит номер проголосованной локации)
            // voting.vote = function "vote" from contract "voting".
            // expectedLocationId - голосуем за локацию №8 (отправляем параметр expectedLocationId, который задан как 8)

        Assert.equal(
                    // сравниваем переменные "returnedId" и "expectedLocationId"
                    // они д.б. равны
            returnedId, // значение, которое возвращает функция
            expectedLocationId, // номер локации, за которую проголосовали (8)
            "User was able to vote for the expected location and expectedVotedLocation should match what is returned."
        );
    }

// Test Function #2 - проверяем адрес
    function testGetVotedLocationAddressByLocationId() public {
        // объявили тестовую функцию

        address location = voting.locations(expectedLocationId);
            // address location - объявили переменную location, тип переменной = address
            // voting.location = ??? в контракте voting нет функции location, не понимаю на что ссылаемся
            // expectedLocationId (задано как 8)
            // "So, the location function is going to return the address in the blockchain for this location ID."
            // (нет такой функции)

        Assert.equal(
            location, // значение созданной переменной
            expectedVotedLocation, // address of the voted location
            "Voted Location of the expected location should be this contract"
        );
    }

// Test Function #3 - test the location address by location ID in the array.
    function testGetVotedLocationAddressByLocationIdInArray() public {
        // объявили тестовую функцию

        address[16] memory locations = voting.getLocations();
            // создали переменную locations, с типом address[16]
            // memory -- Solidity will temporarily store the value in memory.
            // voting.getLocations() -- функция getLocations из файла Voting. Она возвращает массив со списком проголосованных локаций

        Assert.equal(
            locations[expectedLocationId],
                // взять локацию с id 8 (expectedLocationId) из всего массива проголосованных локаций (locations)
            expectedVotedLocation,
                // address of the voted location
            "Voted location of the expected location should be this contract"
        );
    }
}