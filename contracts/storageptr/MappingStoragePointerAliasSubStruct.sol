pragma solidity >=0.5.0;

contract MappingStoragePointerAliasSubStruct {

    struct Sub { mapping(address=>int) s; }

    mapping(address=>int) s1;
    Sub s2;

    function test(int a, int b) public {
        require(a != b);
        s1[msg.sender] = a;
        s2.s[msg.sender] = b;
        mapping(address=>int) storage s1ref = s2.s;
        mapping(address=>int) storage s2ref = s2.s;
        assert(s1ref[msg.sender] == b);
        assert(s2ref[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
