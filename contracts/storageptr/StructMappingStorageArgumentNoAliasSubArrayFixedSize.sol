pragma solidity >=0.5.0;

contract StructMappingStorageArgumentNoAliasSubArrayFixedSize {

    struct S { mapping(address=>int) x; }

    S s1;
    S[2] s2;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref.x[msg.sender] != s2ref.x[msg.sender]);
        s1ref.x[msg.sender] = a;
        s2ref.x[msg.sender] = b;
        require(s2[0].x[msg.sender] != a && s2[0].x[msg.sender] != b);
        assert(s1.x[msg.sender] != s2[1].x[msg.sender]);
        assert(s1.x[msg.sender] == a || s1.x[msg.sender] == b);
        assert(s2[1].x[msg.sender] == a || s2[1].x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x[msg.sender] = -1;
        s2[1].x[msg.sender] = -2;
        s2[0].x[msg.sender] = -3;
        test(s1, s2[1], 0, 1);
    }

}
