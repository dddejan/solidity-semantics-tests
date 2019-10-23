pragma solidity >=0.5.0;

contract AssignArrayFixedSizeM2L {

    struct S { int x; }

    int[2] s1;

    function memToLoc(int a, int b) public {
        require(a != b);

        int[2] memory sm;
        sm[1] = a;
        s1[1] = b;
        int[2] storage sl = s1;
        assert(s1[1] == b);
        assert(sl[1] == b);
        assert(sm[1] == a);

        s1 = sm; // Checking that this assignemnt affects sl
        assert(sl[1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        memToLoc(0, 1);
    }
}
