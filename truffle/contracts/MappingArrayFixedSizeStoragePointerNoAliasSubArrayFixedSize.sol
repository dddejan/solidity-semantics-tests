pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStoragePointerNoAliasSubArrayFixedSize {

    struct Sub { mapping(address=>int[2]) s; }

    mapping(address=>int[2]) s1;
    mapping(address=>int[2])[2] s2;

    function test(int a, int b) public {
        s1[msg.sender][1] = a;
        s2[1][msg.sender][1] = b;
        mapping(address=>int[2]) storage s1ref = s1;
        mapping(address=>int[2]) storage s2ref = s2[1];
        assert(s1ref[msg.sender][1] == a);
        assert(s2ref[msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
