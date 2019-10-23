pragma solidity >=0.5.0;

contract ArrayFixedSizeStoragePointerAlias {

    int[2] s1;
    int[2] s2;

    function test(int a, int b) public {
        require(a != b);
        s1[1] = a;
        s2[1] = b;
        int[2] storage s1ref = s1;
        int[2] storage s2ref = s1;
        assert(s1ref[1] == a);
        assert(s2ref[1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
