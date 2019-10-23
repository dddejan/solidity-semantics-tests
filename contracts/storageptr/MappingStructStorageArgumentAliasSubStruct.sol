pragma solidity >=0.5.0;

contract MappingStructStorageArgumentAliasSubStruct {

    struct S { int x; }
    struct Sub { mapping(address=>S) s; }

    Sub s;

    function test(mapping(address=>S) storage s1ref, mapping(address=>S) storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref[msg.sender].x = s2ref[msg.sender].x + 1;
        s1ref_alias_s2ref = (s1ref[msg.sender].x == s2ref[msg.sender].x);
        require(s1ref_alias_s2ref);
        s1ref[msg.sender].x = a;
        s2ref[msg.sender].x = b;
        assert(s1ref[msg.sender].x == s2ref[msg.sender].x);
        assert(s.s[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s.s, s.s, 0, 1);
    }

}
