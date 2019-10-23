pragma solidity ^0.5.0;

contract DeleteStorageArrayDynamicStruct {
    struct S { int x; }
    S[] a;
    constructor() public {
        a.push(S(0));
        a.push(S(1));
        assert(a.length == 2);
        delete a;
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
