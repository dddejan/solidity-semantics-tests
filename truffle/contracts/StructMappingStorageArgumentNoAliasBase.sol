pragma solidity >=0.5.0;

contract StructMappingStorageArgumentNoAliasBase {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref.x[msg.sender] != s2ref.x[msg.sender]);
        s1ref.x[msg.sender] = a;
        s2ref.x[msg.sender] = b;
        assert(s1.x[msg.sender] != s2.x[msg.sender]);
        assert(s1.x[msg.sender] == a || s1.x[msg.sender] == b);
        assert(s2.x[msg.sender] == a || s2.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x[msg.sender] = -1;
        s2.x[msg.sender] = -2;
        test(s1, s2, 0, 1);
    }

}
