pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructL2L {

    struct S { int x; }

    S[2] s1;
    S[2] s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1[1].x = a;
        s2[1].x = b;
        S[2] storage sl1 = s1;
        S[2] storage sl2 = s2;
        assert(sl1[1].x == a);
        assert(sl2[1].x == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[1].x = c;
        assert(sl1[1].x == c);
        assert(sl2[1].x == c);
        assert(s1[1].x == a);
        assert(s2[1].x == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
