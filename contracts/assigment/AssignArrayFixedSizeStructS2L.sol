pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructS2L {

    struct S { int x; }

    S[2] s1;
    S[2] s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1].x = a;
        s2[1].x = b;
        S[2] storage loc = s1; // Checking this assignemnt
        assert(s1[1].x == a);
        assert(s2[1].x == b);
        assert(loc[1].x == a);

        s1[1].x = c;
        assert(s1[1].x == c);
        assert(s2[1].x == b);
        assert(loc[1].x == c);

        loc[1].x = a;
        assert(s1[1].x == a);
        assert(s2[1].x == b);
        assert(loc[1].x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
