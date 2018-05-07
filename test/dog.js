var Dog = artifacts.require("./Dog.sol");

contract('Dog', function(accounts) {

  it("Dog contract test", function() {
    var dog;
    return Dog.deployed().then(function(instance) {
      dog = instance;
      return dog.getInfo();
    }).then(function(result) {
      console.log(result);
      return dog.isOwner(accounts[0]);
    }).then(function(result) {
      console.log(result);
      return dog.transferOwnership(accounts[1], 'newMaster');
    }).then(function(result) {
      
      console.log(result);
      return dog.getInfo();
    }).then(function(result) {
      console.log(result);
    });
  });
});
