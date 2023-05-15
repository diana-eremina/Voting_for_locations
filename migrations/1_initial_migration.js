var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};

// This script handles deploying the Migrations.sol contract to observe subsequent smart contract migrations
// and ensure we don't double migrate and change contracts in the future.