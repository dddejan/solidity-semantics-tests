pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeMultiL2L {

    struct S { int[2][3] x; }

    S s1;
    S s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1.x[2][1] = a;
        s2.x[2][1] = b;
        S storage sl1 = s1;
        S storage sl2 = s2;
        assert(sl1.x[2][1] == a);
        assert(sl2.x[2][1] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1.x[2][1] = c;
        assert(sl1.x[2][1] == c);
        assert(sl2.x[2][1] == c);
        assert(s1.x[2][1] == a);
        assert(s2.x[2][1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
