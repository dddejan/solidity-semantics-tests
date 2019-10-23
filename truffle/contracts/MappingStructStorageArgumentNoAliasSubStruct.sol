pragma solidity >=0.5.0;

contract MappingStructStorageArgumentNoAliasSubStruct {

    struct S { int x; }
    struct Sub { mapping(address=>S) s; }

    mapping(address=>S) s1;
    Sub s2;

    function test(mapping(address=>S) storage s1ref, mapping(address=>S) storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref[msg.sender].x != s2ref[msg.sender].x);
        s1ref[msg.sender].x = a;
        s2ref[msg.sender].x = b;
        assert(s1[msg.sender].x != s2.s[msg.sender].x);
        assert(s1[msg.sender].x == a || s1[msg.sender].x == b);
        assert(s2.s[msg.sender].x == a || s2.s[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s1, s2.s, 0, 1);
    }

}
