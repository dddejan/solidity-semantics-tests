pragma solidity ^0.5.0;

contract DeleteStorageArrayDynamicMulti {
    int[][] a;
    int[] empty;
    constructor() public {
        assert(a.length == 0);
        a.push(empty);
        a[0].push(0);
        assert(a.length == 1);
        assert(a[0].length == 1);
        delete a[0];
        assert(a[0].length == 0);
        delete a;
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
