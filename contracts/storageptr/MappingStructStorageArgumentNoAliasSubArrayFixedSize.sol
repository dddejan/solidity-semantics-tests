pragma solidity >=0.5.0;

contract MappingStructStorageArgumentNoAliasSubArrayFixedSize {

    struct S { int x; }

    mapping(address=>S) s1;
    mapping(address=>S)[2] s2;

    function test(mapping(address=>S) storage s1ref, mapping(address=>S) storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref[msg.sender].x != s2ref[msg.sender].x);
        s1ref[msg.sender].x = a;
        s2ref[msg.sender].x = b;
        require(s2[0][msg.sender].x != a && s2[0][msg.sender].x != b);
        assert(s1[msg.sender].x != s2[1][msg.sender].x);
        assert(s1[msg.sender].x == a || s1[msg.sender].x == b);
        assert(s2[1][msg.sender].x == a || s2[1][msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s1, s2[1], 0, 1);
    }

}
