pragma solidity >=0.5.0;

contract MappingStructStoragePointerNoAliasSubArrayFixedSize {

    struct S { int x; }

    mapping(address=>S) s1;
    mapping(address=>S)[2] s2;

    function test(int a, int b) public {
        s1[msg.sender].x = a;
        s2[1][msg.sender].x = b;
        mapping(address=>S) storage s1ref = s1;
        mapping(address=>S) storage s2ref = s2[1];
        assert(s1ref[msg.sender].x == a);
        assert(s2ref[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
