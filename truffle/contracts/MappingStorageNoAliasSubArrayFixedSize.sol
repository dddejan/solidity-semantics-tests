pragma solidity >=0.5.0;

contract MappingStorageNoAliasSubArrayFixedSize {

    mapping(address=>int) s1;
    mapping(address=>int)[2] s2;

    function test(int a, int b) public {
        s1[msg.sender] = a;
        s2[1][msg.sender] = b;
        assert(s1[msg.sender] == a);
        assert(s2[1][msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
