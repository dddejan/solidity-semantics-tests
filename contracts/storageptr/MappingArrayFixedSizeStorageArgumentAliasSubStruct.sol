pragma solidity >=0.5.0;

contract MappingArrayFixedSizeStorageArgumentAliasSubStruct {

    struct Sub { mapping(address=>int[2]) s; }

    Sub s;

    function test(mapping(address=>int[2]) storage s1ref, mapping(address=>int[2]) storage s2ref, int a, int b) internal {
        require(a != b);
        bool s1_ref_alias_s2_ref = false;
        s1ref[msg.sender][0] = s2ref[msg.sender][1] + 1;
        s1_ref_alias_s2_ref = (s1ref[msg.sender][0] == s2ref[msg.sender][0]);
        require(s1_ref_alias_s2_ref);
        s1ref[msg.sender][1] = a;
        s2ref[msg.sender][1] = b;
        assert(s1ref[msg.sender][1] == s2ref[msg.sender][1]);
        assert(s.s[msg.sender][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s.s, s.s, 0, 1);
    }

}
