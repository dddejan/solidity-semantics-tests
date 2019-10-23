pragma solidity >=0.5.0;

contract StructMappingStoragePointerNoAliasBase {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function test(int a, int b) public {
        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        S storage s1ref = s1;
        S storage s2ref = s2;
        assert(s1ref.x[msg.sender] == a);
        assert(s2ref.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
