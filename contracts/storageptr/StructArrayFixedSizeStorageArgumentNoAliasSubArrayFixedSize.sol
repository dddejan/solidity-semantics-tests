pragma solidity >=0.5.0;

contract StructArrayFixedSizeStorageArgumentNoAliasSubArrayFixedSize {

    struct S { int[2] x; }
    struct Sub { S s; }

    S s1;
    S[2] s2;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref.x[1] != s2ref.x[1]);
        s1ref.x[1] = a;
        s2ref.x[1] = b;
        assert(s1.x[1] != s2[1].x[1]);
        assert(s1.x[1] == a || s1.x[1] == b);
        require(s2[0].x[1] != a && s2[0].x[1] != b);
        assert(s2[1].x[1] == a || s2[1].x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x[1] = -1;
        s2[1].x[1] = -2;
        s2[0].x[1] = -3;
        test(s1, s2[1], 0, 1);
    }

}
