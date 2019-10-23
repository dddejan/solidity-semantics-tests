pragma solidity >=0.5.0;

contract MappingStorageNoAliasSubStruct {

    struct Sub { mapping(address=>int) s; }

    mapping(address=>int) s1;
    Sub s2;

    function test(int a, int b) public {
        s1[msg.sender] = a;
        s2.s[msg.sender] = b;
        assert(s1[msg.sender] == a);
        assert(s2.s[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
