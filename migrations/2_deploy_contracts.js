var CivFactory = artifacts.require("./CivFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(CivFactory, "test", 255, 4);
};
