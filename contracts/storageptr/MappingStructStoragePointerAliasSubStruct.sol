pragma solidity >=0.5.0;

contract MappingStructStoragePointerAliasSubStruct {

    struct S { int x; }
    struct Sub { mapping(address=>S) s; }

    mapping(address=>S) s1;
    Sub s2;

    function test(int a, int b) public {
        require(a != b);
        s1[msg.sender].x = a;
        s2.s[msg.sender].x = b;
        mapping(address=>S) storage s1ref = s2.s;
        mapping(address=>S) storage s2ref = s2.s;
        assert(s1ref[msg.sender].x == b);
        assert(s2ref[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
