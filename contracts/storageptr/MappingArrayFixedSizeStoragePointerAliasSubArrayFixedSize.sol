pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStoragePointerAliasSubArrayFixedSize {

    struct Sub { mapping(address=>int[2]) s; }

    mapping(address=>int[2]) s1;
    Sub s2;

    function test(int a, int b) public {
        require(a != b);
        s1[msg.sender][1] = a;
        s2.s[msg.sender][1] = b;
        mapping(address=>int[2]) storage s1ref = s2.s;
        mapping(address=>int[2]) storage s2ref = s2.s;
        assert(s1ref[msg.sender][1] == b);
        assert(s2ref[msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
