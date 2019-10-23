pragma solidity >=0.5.0;

contract MappingStorageArgumentAliasBase {

    mapping(address=>int) s;

    function test(mapping(address=>int) storage s1ref, mapping(address=>int) storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1ref_alias_s2ref = false;
        s1ref[msg.sender] = s2ref[msg.sender] + 1;
        s1ref_alias_s2ref = (s1ref[msg.sender] == s2ref[msg.sender]);
        require(s1ref_alias_s2ref);
        s1ref[msg.sender] = a;
        s2ref[msg.sender] = b;
        assert(s1ref[msg.sender] == s2ref[msg.sender]);
        assert(s[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s, s, 0, 1);
    }

}
