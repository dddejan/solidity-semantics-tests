pragma solidity ^0.5.0;

contract DeleteStorageArrayFixedSize {
    int[2] a;
    constructor() public {
        assert(a.length == 2);
        a[0] = 1;
        a[1] = 2;
        delete a;
        assert(a.length == 2);
        assert(a[0] == 0);
        assert(a[1] == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
