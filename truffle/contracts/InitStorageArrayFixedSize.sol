pragma solidity ^0.5.0;

contract InitStorageArrayFixedSize {
    int[2] a;
    constructor() public {
        assert(a.length == 2);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
