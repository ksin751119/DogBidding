var Dog = artifacts.require("./Dog.sol");
var DogFactory = artifacts.require("./DogFactory.sol");


module.exports = function(deployer) {
  //deployer.deploy(Dog, 'milk', 'so cute', 5, 10, 1, 1);
  deployer.deploy(DogFactory, 5);
};
