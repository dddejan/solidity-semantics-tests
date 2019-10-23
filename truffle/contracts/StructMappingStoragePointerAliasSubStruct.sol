pragma solidity >=0.5.0;

contract StructMappingStoragePointerAliasSubStruct {

    struct S { mapping(address=>int) x; }
    struct Sub { S s; }

    S s1;
    Sub s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x[msg.sender] = a;
        s2.s.x[msg.sender] = b;
        S storage s1ref = s2.s;
        S storage s2ref = s2.s;
        assert(s1ref.x[msg.sender] == b);
        assert(s2ref.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
