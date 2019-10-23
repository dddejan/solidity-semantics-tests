pragma solidity >=0.5.0;

contract StructStorageArgumentAliasSubArrayFixedSize {

    struct S { int x; }

    S[2] s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        s1ref.x = a;
        s2ref.x = b;
        assert(s1ref.x == s2ref.x);
        require(s[0].x != b);
        assert(s[1].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s[1], s[1], 0, 1);
    }

}
