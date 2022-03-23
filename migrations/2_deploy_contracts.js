var GameFactory = artifacts.require("./GameFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(GameFactory, "test", 16, 16, 4);
};
