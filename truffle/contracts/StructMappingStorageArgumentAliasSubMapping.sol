pragma solidity >=0.5.0;

contract StructMappingStorageArgumentAliasSubMapping {

    struct S { mapping(address=>int) x; }

    mapping(address=>S) s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref.x[msg.sender] = s2ref.x[msg.sender] + 1;
        s1ref_alias_s2ref = (s1ref.x[msg.sender] == s2ref.x[msg.sender]);
        require(s1ref_alias_s2ref);
        s1ref.x[msg.sender] = a;
        s2ref.x[msg.sender] = b;
        assert(s1ref.x[msg.sender] == s2ref.x[msg.sender]);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s[msg.sender], s[msg.sender], 0, 1);
    }

}
