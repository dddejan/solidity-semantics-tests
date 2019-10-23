pragma solidity >=0.5.0;

contract StructMappingStorageNoAliasSubMapping {

    struct S { mapping(address=>int) x; }
    struct Sub { S s; }

    S s1;
    mapping(address=>S) s2;

    function test(int a, int b) public {
        s1.x[msg.sender] = a;
        s2[msg.sender].x[msg.sender] = b;
        assert(s1.x[msg.sender] == a);
        assert(s2[msg.sender].x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
