pragma solidity ^0.5.0;

contract DeleteStorageArrayDynamic {
    int[] a;
    constructor() public {
        a.push(0);
        a.push(1);
        assert(a.length == 2);
        delete a;
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
