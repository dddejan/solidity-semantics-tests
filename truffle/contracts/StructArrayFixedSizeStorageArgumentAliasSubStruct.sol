pragma solidity >=0.5.0;

contract StructArrayFixedSizeStorageArgumentAliasSubStruct {

    struct S { int[2] x; }
    struct Sub { S s; }

    Sub s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref.x[1] = s2ref.x[1] + 1;
        s1ref_alias_s2ref = (s1ref.x[1] == s2ref.x[1]);
        require(s1ref_alias_s2ref);
        s1ref.x[1] = a;
        s2ref.x[1] = b;
        assert(s1ref.x[1] == s2ref.x[1]);
        assert(s.s.x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s.s, s.s, 0, 1);
    }

}
