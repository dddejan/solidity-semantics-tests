pragma solidity >=0.5.0;

contract MappingStructStorageNoAliasSubStruct {

    struct S { int x; }
    struct Sub { mapping(address=>S) s; }

    mapping(address=>S) s1;
    Sub s2;

    function test(int a, int b) public {
        s1[msg.sender].x = a;
        s2.s[msg.sender].x = b;
        assert(s1[msg.sender].x == a);
        assert(s2.s[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
