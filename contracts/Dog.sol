pragma solidity ^0.4.4;


contract Dog {
  
    enum dog_sex {male, female}
    enum dog_type{Corgi, Shiba, Husky}

    address owner;
    uint birthday;
    string name;
    string adopter;
    string description;
    uint weight;
    uint height;
    dog_sex dsex;
    dog_type dtype;

    event DogOwnerTransfered(string from, string to, uint date);
    modifier OwnerOnly {require(msg.sender == owner); _;}


    function Dog(string _name, string _descr, uint _weight, uint _height, uint8 _sex, uint8 _type) public{
        // constructor
        owner = msg.sender;
        birthday = now;
        name = _name;
        description = _descr;
        weight = _weight;
        height = _height;
        dsex = dog_sex(_sex);
        dtype = dog_type(_type);
        adopter = "Contract Creater";
    }

        // transfer the ownership
    function  transferOwnership (address newOwner, string nm) public OwnerOnly {
        string former = adopter; 
        owner = newOwner;
        adopter = nm;
        DogOwnerTransfered(former, adopter, now);
    }

    function  isOwner(address addr) public view returns(bool) {
        return (addr == owner);
    }

    function  getInfo() public view returns(address, uint, string, string, string, uint, uint, uint8, uint8) {
        return (owner, birthday, name, adopter, description, weight, height, uint8(dsex), uint8(dtype));
    }

    function dogKill() public OwnerOnly{
        selfdestruct(owner);
    }
}
