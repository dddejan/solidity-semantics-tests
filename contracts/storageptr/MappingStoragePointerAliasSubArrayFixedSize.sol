pragma solidity >=0.5.0;

contract MappingStoragePointerAliasSubArrayFixedSize {

    mapping(address=>int) s1;
    mapping(address=>int)[2] s2;

    function test(int a, int b) public {
        require(a != b);
        s1[msg.sender] = a;
        s2[1][msg.sender] = b;
        mapping(address=>int) storage s1ref = s2[1];
        mapping(address=>int) storage s2ref = s2[1];
        assert(s1ref[msg.sender] == b);
        assert(s2ref[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
