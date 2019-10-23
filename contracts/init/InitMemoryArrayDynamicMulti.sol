pragma solidity ^0.5.0;

contract InitMemoryArrayDynamicMulti {
    function test(uint n) public pure {
        require(n > 0);
        int[][] memory a;
        assert(a.length == 0);
        a = new int[][](n);
        assert(a.length == n);
        assert(a[0].length == 0);
        assert(a[n-1].length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external pure {
        test(100);
    }
}
