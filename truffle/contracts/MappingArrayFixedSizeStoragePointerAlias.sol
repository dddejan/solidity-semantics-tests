pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStoragePointerAlias {

    mapping(address=>int[2]) s1;
    mapping(address=>int[2]) s2;

    function test(int a, int b) public {
        require(a != b);
        s1[msg.sender][1] = a;
        s2[msg.sender][1] = b;
        mapping(address=>int[2]) storage s1ref = s1;
        mapping(address=>int[2]) storage s2ref = s1;
        assert(s1ref[msg.sender][1] == a);
        assert(s2ref[msg.sender][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
