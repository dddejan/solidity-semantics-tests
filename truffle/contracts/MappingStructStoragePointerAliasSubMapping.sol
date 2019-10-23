pragma solidity >=0.5.0;

contract MappingStructStoragePointerAliasSubMapping {

    struct S { int x; }

    mapping(address=>S) s1;
    mapping(address=>mapping(address=>S)) s2;

    function test(int a, int b) public {
        require(a != b);
        s1[msg.sender].x = a;
        s2[msg.sender][msg.sender].x = b;
        mapping(address=>S) storage s1ref = s2[msg.sender];
        mapping(address=>S) storage s2ref = s2[msg.sender];
        assert(s1ref[msg.sender].x == b);
        assert(s2ref[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
