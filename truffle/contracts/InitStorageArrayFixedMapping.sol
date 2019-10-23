pragma solidity >=0.5.0;

contract InitStorageArrayFixedMapping {
    mapping(address=>int)[2] a;
    constructor() public {
        assert(a.length == 2);
        assert(a[0][msg.sender] == 0);
        assert(a[1][msg.sender] == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external {
    }
}

