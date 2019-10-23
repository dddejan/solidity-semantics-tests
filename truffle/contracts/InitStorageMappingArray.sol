pragma solidity ^0.5.0;

contract InitStorageMappingArray {
    mapping(address => int[]) m;
    constructor() public {
        assert(m[msg.sender].length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
