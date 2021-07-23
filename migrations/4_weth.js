const artifact = artifacts.require("WETH10/WETH10");
const artifact2 = artifacts.require("WETH10/WethConverter");

module.exports = async function (deployer) {
  await deployer.deploy(artifact);
  await deployer.deploy(artifact2);
};
