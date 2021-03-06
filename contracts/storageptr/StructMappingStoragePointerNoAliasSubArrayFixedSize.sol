pragma solidity >=0.5.0;

contract StructMappingStoragePointerNoAliasSubArrayFixedSize {

    struct S { mapping(address=>int) x; }
    struct Sub { S s; }

    S s1;
    S[2] s2;

    function test(int a, int b) public {
        s1.x[msg.sender] = a;
        s2[1].x[msg.sender] = b;
        S storage s1ref = s1;
        S storage s2ref = s2[1];
        assert(s1ref.x[msg.sender] == a);
        assert(s2ref.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
