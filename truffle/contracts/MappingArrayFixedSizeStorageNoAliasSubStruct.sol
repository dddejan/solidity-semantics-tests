pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStorageNoAliasSubStruct {

    struct Sub { mapping(address=>int[2]) s; }

    mapping(address=>int[2]) s1;
    Sub s2;

    function test(int a, int b) public {
        s1[msg.sender][1] = a;
        s2.s[msg.sender][1] = b;
        assert(s1[msg.sender][1] == a);
        assert(s2.s[msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
