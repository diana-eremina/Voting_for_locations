var Voting = artifacts.require("Voting");
// объявили переменную Voting, упомянув название нашего контракта
// artifacts - так называли документы созданные в результате "truffle compile"
// но папки с таким названием в системе нет, так что непонятно откуда система знате это слово

module.exports = function (deployer) {
deployer.deploy(Voting);
};
// This is going to deploy our contracts.