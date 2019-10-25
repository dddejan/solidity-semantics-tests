pragma solidity >=0.5.0;

contract ArrayFixedSizeStorageArgumentNoAliasSubStruct {

    struct Sub { int[2] s; }

    int[2] s1;
    Sub s2;

    function test(int[2] storage s1ref, int[2] storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref[1] != s2ref[1]);
        s1ref[1] = a;
        s2ref[1] = b;
        assert(s1[1] != s2.s[1]);
        assert(s1[1] == a || s1[1] == b);
        assert(s2.s[1] == a || s2.s[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1[1] = -1;
        s2.s[1] = -2;
        test(s1, s2.s, 0, 1);
    }

}
