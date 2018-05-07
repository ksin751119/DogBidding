var DogFactory = artifacts.require("./DogFactory.sol");

contract('DogFactory', function(accounts) {

  it("Dog contract test", function() {
    var dogfactory;
    return DogFactory.deployed().then(function(instance) {
      dogfactory = instance;
      return dogfactory.generateDog('milk', 'QQ', 1, 1, 0, 0);
    }).then(function(result) {
      console.log(result);
      return dogfactory.getDogCount();
    }).then(function(result) {
      console.log(result.toNumber());
    }).then(function(result) {
      return dogfactory.generateDog('milk2', 'QQ2', 1, 1, 0, 0);
    }).then(function(result) {
      console.log(result);
      return dogfactory.getDogCount();
    }).then(function(result) {
      console.log(result.toNumber());
      return dogfactory.getDogInfo(1);
    }).then(function(result) {
      console.log(result);
      return dogfactory.getDogAddress(1);
    }).then(function(result) {
      console.log(result);
    });
  });
});
