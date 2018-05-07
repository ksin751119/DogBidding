pragma solidity ^0.4.4;

import "./Dog.sol";


contract DogFactory {

    

    // Maintains all the child contracts
    Dog[] dogs;
    uint maxDogs;
    
    // Price of the asset

    // Constructor
    // Creates the child contracts
    function DogFactory(uint8  dogCount) public {
        maxDogs = dogCount;
        /*
        for(uint8 i = 0; i < numParts; i++){
            children.push(new Dog(i, this, "***"));
        }
        initialPrice = price;*/
    }

    function generateDog(string _name, string _descr, uint _weight, uint _height, uint8 _sex, uint8 _type) public{
        dogs.push(new Dog(_name, _descr, _weight, _height, _sex, _type));
    }

    function getDogCount() public view returns(uint){
        return dogs.length;
    }

    function getDogInfo(uint dogIndex) public view returns(address, uint, string, string, string, uint, uint, uint8, uint8){
        return dogs[dogIndex].getInfo();
    }

    function getDogAddress(uint dogIndex) public view returns(address){
        return address(dogs[dogIndex]);
    }


    /*
    // Anyone can pay the price and purchase the asset

    function  purchase(bytes32 name) payable public {

        if(msg.value < initialPrice) revert();

        // Look for available asset i.e., one that is not sold yet
        for(uint8 i = 0; i < children.length; i++){
            // Check if contract factoy is the owner
            if(children[i].isOwner(this)){
                children[i].transferOwnership(msg.sender, name);
                return;
            }
        }
        // No more assets available - so throw an exception
        revert();
    }



    // Returns the information about the child contract at specified index
    function  getInfo(uint8 childIndex) public constant returns(uint8, address, bytes32){
        // Simply return the values
        return (children[childIndex].identity(),children[childIndex].owner(),children[childIndex].name());
    }

    // Returns the child contract address
    function  getDogContractAddress(uint8 childIndex) public view returns (address){
        return address(children[childIndex]);
    }

    // Returns name of the owner based on the child index
    function  getOwnerName(uint8 childIndex) public constant returns(bytes32){
        bytes32  namer = children[childIndex].name();
        return namer;
    }
    // Returns the count of the children
    function  getChildrenCount() public constant returns (uint){
        return children.length;
    }
    */
  
}
