var MaliciousUser = artifacts.require("./MaliciousUser.sol");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(MaliciousUser);
};