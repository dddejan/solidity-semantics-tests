pragma solidity >=0.5.0;

contract StructMappingStorageNoAliasSubStruct {

    struct S { mapping(address=>int) x; }
    struct Sub { S s; }

    S s1;
    Sub s2;

    function test(int a, int b) public {
        s1.x[msg.sender] = a;
        s2.s.x[msg.sender] = b;
        assert(s1.x[msg.sender] == a);
        assert(s2.s.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
