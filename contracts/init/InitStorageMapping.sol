pragma solidity ^0.5.0;

contract InitStorageMapping {
    mapping(address => int) m;
    constructor() public {
        assert(m[msg.sender] == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
