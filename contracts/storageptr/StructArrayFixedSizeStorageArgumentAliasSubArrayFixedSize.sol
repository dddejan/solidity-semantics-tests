pragma solidity >=0.5.0;

contract StructArrayFixedSizeStorageArgumentAliasSubArrayFixedSize {

    struct S { int[2] x; }

    S[2] s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref.x[1] = s2ref.x[1] + 1;
        s1ref_alias_s2ref = (s1ref.x[1] == s2ref.x[1]);
        require(s1ref_alias_s2ref);
        s1ref.x[1] = a;
        s2ref.x[1] = b;
        assert(s1ref.x[1] == s2ref.x[1]);
        require(s[0].x[1] != b);
        assert(s[1].x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s[1], s[1], 0, 1);
    }

}
