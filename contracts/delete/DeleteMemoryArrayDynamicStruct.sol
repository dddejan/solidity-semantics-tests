pragma solidity ^0.5.0;

contract DeleteMemoryArrayDynamicStruct {
    struct S { int x; }
    function test(uint n) public pure {
        require(n > 0);
        S[] memory a = new S[](n);
        assert(a.length == n);
        delete a;
        assert(a.length == 0);
    }
    // Boilerplate to run with truffle
    function truffleMain() external pure {
        test(100);
    }
}
