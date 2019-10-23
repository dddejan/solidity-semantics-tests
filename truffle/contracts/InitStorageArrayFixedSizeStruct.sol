pragma solidity ^0.5.0;

contract InitStorageArrayFixedSizeStruct {
    struct S {
        int x;
    }
    S[2][3] a;
    constructor() public {
        assert(a.length == 3);
        assert(a[0].length == 2);
        assert(a[1].length == 2);
        assert(a[0][0].x == 0);
        assert(a[1][0].x == 0);
        assert(a[2][0].x == 0);
        assert(a[0][1].x == 0);
        assert(a[1][1].x == 0);
        assert(a[2][1].x == 0);
    }

    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
