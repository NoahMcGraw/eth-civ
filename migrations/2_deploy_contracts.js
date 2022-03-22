var CivFactory = artifacts.require("./CivFactory.sol");

module.exports = function(deployer) {
  deployer.deploy(CivFactory);
};
