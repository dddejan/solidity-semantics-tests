pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeMultiS2L {

    struct S { int[2][3] x; }

    S s1;
    S s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1.x[2][1] = a;
        s2.x[2][1] = b;
        S storage loc = s1; // Checking this assignemnt
        assert(s1.x[2][1] == a);
        assert(s2.x[2][1] == b);
        assert(loc.x[2][1] == a);

        s1.x[2][1] = c;
        assert(s1.x[2][1] == c);
        assert(s2.x[2][1] == b);
        assert(loc.x[2][1] == c);

        loc.x[2][1] = a;
        assert(s1.x[2][1] == a);
        assert(s2.x[2][1] == b);
        assert(loc.x[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
