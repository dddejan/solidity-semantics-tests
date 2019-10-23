pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStorageArgumentNoAliasSubStruct {

    struct Sub { mapping(address=>int[2]) s; }

    mapping(address=>int[2]) s1;
    Sub s2;

    function test(mapping(address=>int[2]) storage s1ref, mapping(address=>int[2]) storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref[msg.sender][1] != s2ref[msg.sender][1]);
        s1ref[msg.sender][1] = a;
        s2ref[msg.sender][1] = b;
        assert(s1[msg.sender][1] != s2.s[msg.sender][1]);
        assert(s1[msg.sender][1] == a || s1[msg.sender][1] == b);
        assert(s2.s[msg.sender][1] == a || s2.s[msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1[msg.sender][1] = -1;
        s2.s[msg.sender][1] = -2;
        test(s1, s2.s, 0, 1);
    }

}
