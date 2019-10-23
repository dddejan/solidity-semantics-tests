pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMultiM2L {

    int[2][3]s1;

    function memToLoc(int a, int b) public {
        require(a != b);

        int[2][3] memory sm;
        sm[2][1] = a;
        s1[2][1] = b;
        int[2][3] storage sl = s1;
        assert(s1[2][1] == b);
        assert(sl[2][1] == b);
        assert(sm[2][1] == a);

        s1 = sm; // Checking that this assignemnt affects sl
        assert(sl[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        memToLoc(0, 1);
    }
}
