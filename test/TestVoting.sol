pragma solidity >=0.4.22 <0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
  // These first two imports are referring to global Truffle files, not a Truffle directory.
  // Assert.sol gives us various assertions to using in our tests
  // truffle/DeployedAddresses.sol will deploy a fresh instance of the contract being tested to the blockchain (Voting.sol)

import "../contracts/Voting.sol";
  // the smart contract we want you to test

// Set Up the Contract Tests
contract TestVoting{

    Voting voting = Voting(DeployedAddresses.Voting());
      // we need to initiate the Voting contract to the deployed contract
      // This will be used to call the functions inside of Voting contracts.
      // * Voting - это название файла, где лежит функция, и название контракта
      // * vote - это название функции в этом файле.

    uint256 expectedLocationId = 8;
      // This is the expected voted location for these tests
      // Например, тест будет голосовать за локацию №8

    address expectedVotedLocation = address(this);
      // This will return the address of the voted location.
      // before we were setting the ID of the location that we are going to test (expectedLocationId)
      // And now we are just setting what is the address of this location in the blockchain.
}

// Test Function #1
  // Now we are going to test if the user can really vote the location with ID 8 and if the returned ID matched.
  // So basically, we are testing the vote function here.

    function testUserCanVoteLocation() public {
        // объявили тестовую функцию

    // вызов функции голосования
        uint256 returnedId = voting.vote(expectedLocationId);
            // uint256 returnedId - объявили переменную returnedId
            // положили в эту переменную то, что возвращает функция vote
            // (функция возвратит номер проголосованной локации)
            // voting.vote = function "vote" from contract "voting".
            // expectedLocationId - голосуем за локацию №8 (отправляем параметр expectedLocationId, который задан как 8)

    // проверка функции голосования
        Assert.equal(
            // сравниваем переменные "returnedId" и "expectedLocationId"
            // они д.б. равны
        returnedId, // значение, которое возвращает функция
        expectedLocationId, // номер локации, за которую проголосовали (8)
        "User was able to vote for the expected location and expectedVotedLocation should match what is returned."
            // it's the message that we are going to display.
        );

    }

// Test Function #2
  // compare the address in the blockchain of the location that was voted with the one that we are expecting.
  // There is an error on this function, but we are going to figure it out when compiling the contract.
  // Я ИЗМЕНИЛА ТУТ voting.location на voting.locations!

    function testGetVotedLocationAddressByLocationId() public {
    // объявили тестовую функцию

    // создали переменную location
        address location = voting.locations(expectedLocationId);
        // address location - объявили переменную location, тип переменной = address
        // voting.locations = переменная "locations" from contract "voting". Это массив.
        // expectedLocationId (задано как 8)
        // So, the location function is going to return the address in the blockchain for this location ID.
        // (не поняла. Вернется ведь весь массив locations, а не 1 значение?)

    // сравниванием переменные
        Assert.equal(
            location, // значение созданной переменной
            expectedVotedLocation, //
            'Voted Location of the expected location should be this contract'
        );


    }



