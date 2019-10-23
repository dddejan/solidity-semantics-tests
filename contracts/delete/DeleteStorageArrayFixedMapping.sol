pragma solidity >=0.5.0;

contract DeleteStorageArrayFixedMapping {
    mapping(address=>int)[2] a;
    constructor() public {
        assert(a.length == 2);
        a[0][msg.sender] = 1;
        a[1][msg.sender] = 2;
        delete a;
        assert(a.length == 2);
        assert(a[0][msg.sender] == 1);
        assert(a[1][msg.sender] == 2);
    }
    // Boilerplate to run with truffle
    function truffleMain() external {
    }
}

