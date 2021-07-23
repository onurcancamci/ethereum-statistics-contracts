const ExampleCoin = artifacts.require("ExampleCoin");

module.exports = function (deployer) {
  deployer.deploy(ExampleCoin);
};
