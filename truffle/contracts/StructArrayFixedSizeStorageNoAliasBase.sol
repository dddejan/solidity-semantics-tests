pragma solidity >=0.5.0;

contract StructArrayFixedSizeStorageNoAliasBase {

    struct S { int[2] x; }

    S s1;
    S s2;

    function test(int a, int b) public {
        s1.x[1] = a;
        s2.x[1] = b;
        assert(s1.x[1] == a);
        assert(s2.x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
