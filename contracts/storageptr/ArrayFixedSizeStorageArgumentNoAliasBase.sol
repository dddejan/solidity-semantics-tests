pragma solidity >=0.5.0;

contract ArrayFixedSizeStorageArgumentNoAliasBase {

    int[2] s1;
    int[2] s2;

    function test(int[2] storage s1ref, int[2] storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref[1] != s2ref[1]);
        s1ref[1] = a;
        s2ref[1] = b;
        assert(s1[1] != s2[1]);
        assert(s1[1] == a || s1[1] == b);
        assert(s2[1] == a || s2[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1[1] = -1;
        s2[1] = -2;
        test(s1, s2, 0, 1);
    }

}
