pragma solidity >=0.5.0;

contract ArrayFixedSizeStorageArgumentAliasSubStruct {

    struct Sub { int[2] s; }

    Sub s;

    function test(int[2] storage s1ref, int[2] storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref[0] = s2ref[0] + 1;
        s1ref_alias_s2ref = (s1ref[0] == s2ref[0]);
        require(s1ref_alias_s2ref);
        s1ref[1] = a;
        s2ref[1] = b;
        assert(s1ref[1] == s2ref[1]);
        assert(s.s[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s.s, s.s, 0, 1);
    }

}
