pragma solidity ^0.5.0;

contract InitStorageMappingStruct {
    struct S { int x; }
    mapping(address => S) m;
    constructor() public {
        assert(m[msg.sender].x == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
