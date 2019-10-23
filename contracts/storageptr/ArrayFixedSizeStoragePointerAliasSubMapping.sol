pragma solidity >=0.5.0;

contract ArrayFixedSizeStoragePointerAliasSubMapping {

    int[2] s1;
    mapping(address=>int[2]) s2;

    function test(int a, int b) public {
        require(a != b);
        s1[1] = a;
        s2[msg.sender][1] = b;
        int[2] storage s1ref = s2[msg.sender];
        int[2] storage s2ref = s2[msg.sender];
        assert(s1ref[1] == b);
        assert(s2ref[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
