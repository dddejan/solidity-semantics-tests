pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeMultiM2L {
    struct S { int[2][3] x; }

    S s1;

    function memToLoc(int a, int b) public {
        require(a != b);

        S memory sm;
        sm.x[2][1] = a;
        s1.x[2][1] = b;
        S storage sl = s1;
        assert(s1.x[2][1] == b);
        assert(sl.x[2][1] == b);
        assert(sm.x[2][1] == a);

        s1 = sm; // Checking that this assignemnt affects sl
        assert(sl.x[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        memToLoc(0, 1);
    }
}
