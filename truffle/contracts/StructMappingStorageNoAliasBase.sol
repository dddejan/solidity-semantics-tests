pragma solidity >=0.5.0;

contract StructMappingStorageNoAliasBase {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function test(int a, int b) public {
        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
