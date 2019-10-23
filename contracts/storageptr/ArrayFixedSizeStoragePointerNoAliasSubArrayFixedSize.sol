pragma solidity >=0.5.0;

contract ArrayFixedSizeStoragePointerNoAliasSubArrayFixedSize {

    int[2] s1;
    int[2][2] s2;

    function test(int a, int b) public {
        s1[1] = a;
        s2[1][1] = b;
        int[2] storage s1ref = s1;
        int[2] storage s2ref = s2[1];
        assert(s1ref[1] == a);
        assert(s2ref[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
