pragma solidity >=0.5.0;

contract MappingStorageArgumentAliasSubMapping {

    mapping(address=>mapping(address=>int)) s;

    function test(mapping(address=>int) storage s1ref, mapping(address=>int) storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref[msg.sender] = s2ref[msg.sender] + 1;
        s1ref_alias_s2ref = (s1ref[msg.sender] == s2ref[msg.sender]);
        require(s1ref_alias_s2ref);
        s1ref[msg.sender] = a;
        s2ref[msg.sender] = b;
        assert(s1ref[msg.sender] == s2ref[msg.sender]);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s[msg.sender], s[msg.sender], 0, 1);
    }

}
