pragma solidity >=0.5.0;

contract MappingStorageArgumentNoAliasSubArrayFixedSize {

    mapping(address=>int) s1;
    mapping(address=>int)[2] s2;

    function test(mapping(address=>int) storage s1ref, mapping(address=>int) storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref[msg.sender] != s2ref[msg.sender]);
        s1ref[msg.sender] = a;
        s2ref[msg.sender] = b;
        require(s2[0][msg.sender] != a && s2[0][msg.sender] != b);
        assert(s1[msg.sender] != s2[1][msg.sender]);
        assert(s1[msg.sender] == a || s1[msg.sender] == b);
        assert(s2[1][msg.sender] == a || s2[1][msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1[msg.sender] = -1;
        s2[1][msg.sender] = -2;
        s2[0][msg.sender] = -3;
        test(s1, s2[1], 0, 1);
    }

}
