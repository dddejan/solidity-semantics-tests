pragma solidity ^0.5.0;

contract InitStorageArrayDynamicStruct {
    struct S { int x; }
    S[] a;
    constructor() public {
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
