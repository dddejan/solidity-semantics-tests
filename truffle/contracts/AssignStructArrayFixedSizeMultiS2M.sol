pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeMultiS2M {

    struct S { int[2][3] x; }

    S s1;

    function storToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        S memory sm;
        sm.x[2][1] = a;
        s1.x[2][1] = b;
        assert(sm.x[2][1] == a);
        assert(s1.x[2][1] == b);

        sm = s1; // Checking this assignemnt
        assert(s1.x[2][1] == b);
        assert(sm.x[2][1] == b);

        s1.x[2][1] = c;
        assert(s1.x[2][1] == c);
        assert(sm.x[2][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToMem(0, 1, 2);
    }
}
