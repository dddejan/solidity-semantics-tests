pragma solidity >=0.5.0;

contract StructStoragePointerArrayPop {

    struct S { int x; }

    S[] sa;

    function test(int a, int b) public {
        sa.push(S(a));
        S storage s = sa[sa.length-1];
        sa.pop();
        sa.push(S(b));
        assert(s.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }
}
