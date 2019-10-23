pragma solidity ^0.5.0;

contract InitMemoryArrayFixedSize {
    function test() public pure {
        int[2] memory a;
        assert(a.length == 2);
        assert(a[0] == 0);
        assert(a[1] == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external pure {
        test();
    }
}
