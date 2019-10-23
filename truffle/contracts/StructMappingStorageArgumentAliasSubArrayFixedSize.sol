pragma solidity >=0.5.0;

contract StructMappingStorageArgumentAliasSubArrayFixedSize {

    struct S { mapping(address=>int) x; }

    S[2] s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref.x[msg.sender] = s2ref.x[msg.sender] + 1;
        s1ref_alias_s2ref = (s1ref.x[msg.sender] == s2ref.x[msg.sender]);
        require(s1ref_alias_s2ref);
        s1ref.x[msg.sender] = a;
        s2ref.x[msg.sender] = b;
        assert(s1ref.x[msg.sender] == s2ref.x[msg.sender]);
        require(s[0].x[msg.sender] != b);
        assert(s[1].x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s[1], s[1], 0, 1);
    }

}
