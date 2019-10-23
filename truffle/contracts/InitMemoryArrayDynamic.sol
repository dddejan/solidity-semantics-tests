pragma solidity ^0.5.0;

contract InitMemoryArrayDynamic {
    function test(uint n) public pure {
        require(n > 0);
        int[] memory a;
        assert(a.length == 0);
        a = new int[](n);
        assert(a.length == n);
        assert(a[0] == 0);
        assert(a[n-1] == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external pure {
        test(100);
    }
}
