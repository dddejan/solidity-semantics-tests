pragma solidity ^0.5.0;

contract InitStorageMappingNested {
    mapping(address => mapping(address => int)) m;
    constructor() public {
        assert(m[msg.sender][msg.sender] == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
