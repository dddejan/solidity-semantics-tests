pragma solidity >=0.5.0;

contract StructArrayFixedSizeStoragePointerArrayPop {

    struct S { int[2] x; }

    S to_push;
    S[] sa;

    function test(int a, int b) public {
        to_push.x[1] = a;
        sa.push(to_push);
        S storage s = sa[sa.length-1];
        sa.pop();
        to_push.x[1] = b;
        sa.push(to_push);
        assert(s.x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }
}
