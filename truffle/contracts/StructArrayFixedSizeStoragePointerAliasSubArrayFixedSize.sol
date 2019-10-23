pragma solidity >=0.5.0;

contract StructArrayFixedSizeStoragePointerAliasSubArrayFixedSize {

    struct S { int[2] x; }

    S s1;
    S[2] s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x[1] = a;
        s2[1].x[1] = b;
        S storage s1ref = s2[1];
        S storage s2ref = s2[1];
        assert(s1ref.x[1] == b);
        assert(s2ref.x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
