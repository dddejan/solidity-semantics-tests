pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructS2M {

    struct S { int x; }

    S[2] s1;

    function storToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        S[2] memory sm;
        sm[1] = S(a);
        s1[1].x = b;
        assert(sm[1].x == a);
        assert(s1[1].x == b);

        sm = s1; // Checking this assignemnt
        assert(s1[1].x == b);
        assert(sm[1].x == b);

        s1[1].x = c;
        assert(s1[1].x == c);
        assert(sm[1].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToMem(0, 1, 2);
    }
}
