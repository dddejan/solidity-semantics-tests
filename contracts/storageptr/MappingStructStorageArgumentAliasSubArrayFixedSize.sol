pragma solidity >=0.5.0;

contract MappingStructStorageArgumentAliasSubArrayFixedSize {

    struct S { int x; }
    mapping(address=>S)[2] s;

    function test(mapping(address=>S) storage s1ref, mapping(address=>S) storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref[msg.sender].x = s2ref[msg.sender].x + 1;
        s1ref_alias_s2ref = (s1ref[msg.sender].x == s2ref[msg.sender].x);
        require(s1ref_alias_s2ref);
        s1ref[msg.sender].x = a;
        s2ref[msg.sender].x = b;
        require(s[0][msg.sender].x != a && s[0][msg.sender].x != b);
        assert(s1ref[msg.sender].x == s2ref[msg.sender].x);
        assert(s[1][msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s[0][msg.sender].x = -1;
        test(s[1], s[1], 0, 1);
    }

}
