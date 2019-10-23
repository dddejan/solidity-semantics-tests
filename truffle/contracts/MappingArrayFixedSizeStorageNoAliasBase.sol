pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStorageNoAliasBase {

    mapping(address=>int[2]) s1;
    mapping(address=>int[2]) s2;

    function test(int a, int b) public {
        s1[msg.sender][1] = a;
        s2[msg.sender][1] = b;
        assert(s1[msg.sender][1] == a);
        assert(s2[msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
