pragma solidity ^0.5.0;

contract DeleteMemoryArrayDynamicMulti {
    function test(uint n) public pure {
        require(n > 0);
        int[][] memory a = new int[][](n);
        assert(a.length == n);
        delete a;
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external pure {
        test(100);
    }
}
