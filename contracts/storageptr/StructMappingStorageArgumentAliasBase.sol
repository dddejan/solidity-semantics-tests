pragma solidity >=0.5.0;

contract StructMappingStorageArgumentAliasBase {

    struct S { mapping(address=>int) x; }

    S s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref.x[msg.sender] = s2ref.x[msg.sender] + 1;
        s1ref_alias_s2ref = (s1ref.x[msg.sender] == s2ref.x[msg.sender]);
        require(s1ref_alias_s2ref);
        s1ref.x[msg.sender] = a;
        s2ref.x[msg.sender] = b;
        assert(s1ref.x[msg.sender] == s2ref.x[msg.sender]);
        assert(s.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s, s, 0, 1);
    }

}
