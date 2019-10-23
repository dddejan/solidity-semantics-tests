pragma solidity ^0.5.0;

contract InitMemoryArrayDynamicStruct {
    struct S { int x; }
    function test(uint n) public pure {
        require(n > 0);
        S[] memory a;
        assert(a.length == 0);
        a = new S[](n);
        assert(a.length == n);
        assert(a[0].x == 0);
        assert(a[n-1].x == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external pure {
        test(100);
    }
}
