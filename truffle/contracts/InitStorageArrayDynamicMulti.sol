pragma solidity ^0.5.0;

contract InitStorageArrayDynamicMulti {
    int[][] a;
    constructor() public {
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
