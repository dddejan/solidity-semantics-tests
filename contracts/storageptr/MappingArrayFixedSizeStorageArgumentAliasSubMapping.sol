pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStorageArgumentAliasSubMapping {

    mapping(address=>mapping(address=>int[2])) s;

    function test(mapping(address=>int[2]) storage s1ref, mapping(address=>int[2]) storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1_ref_alias_s2_ref = false;
        s1ref[msg.sender][0] = s2ref[msg.sender][1] + 1;
        s1_ref_alias_s2_ref = (s1ref[msg.sender][0] == s2ref[msg.sender][0]);
        require(s1_ref_alias_s2_ref);
        s1ref[msg.sender][1] = a;
        s2ref[msg.sender][1] = b;
        assert(s1ref[msg.sender][1] == s2ref[msg.sender][1]);
        assert(s[msg.sender][msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s[msg.sender], s[msg.sender], 0, 1);
    }

}
