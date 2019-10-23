pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeM2S {

    struct S { int[2][3] x; }

    S s1;

    function memToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        S memory sm;
        sm.x[2][1] = a;

        s1 = sm; // Checking this assignemnt
        assert(s1.x[2][1] == a);
        assert(sm.x[2][1] == a);

        s1.x[2][1] = b;
        assert(s1.x[2][1] == b);
        assert(sm.x[2][1] == a);

        sm.x[2][1] = c;
        assert(s1.x[2][1] == b);
        assert(sm.x[2][1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        memToStor(0, 1, 2);
    }
}
