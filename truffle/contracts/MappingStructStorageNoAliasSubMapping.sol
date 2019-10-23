pragma solidity >=0.5.0;

contract MappingStructStorageNoAliasSubMapping {

    struct S { int x; }

    mapping(address=>S) s1;
    mapping(address=>mapping(address=>S)) s2;

    function test(int a, int b) public {
        s1[msg.sender].x = a;
        s2[msg.sender][msg.sender].x = b;
        assert(s1[msg.sender].x == a);
        assert(s2[msg.sender][msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
