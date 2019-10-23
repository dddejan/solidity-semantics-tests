pragma solidity >=0.5.0;

contract ArrayFixedSizeStorageNoAliasSubStruct {

    struct Sub { int[2] s; }

    int[2] s1;
    Sub s2;

    function test(int a, int b) public {
        s1[1] = a;
        s2.s[1] = b;
        assert(s1[1] == a);
        assert(s2.s[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
