pragma solidity >=0.5.0;

contract StructMappingStoragePointerAlias {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        S storage s1ref = s1;
        S storage s2ref = s1;
        assert(s1ref.x[msg.sender] == a);
        assert(s2ref.x[msg.sender] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
