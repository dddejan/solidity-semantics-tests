pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMultiS2L {

    int[2][3] s1;
    int[2][3] s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[2][1] = a;
        s2[2][1] = b;
        int[2][3] storage loc = s1; // Checking this assignemnt
        assert(s1[2][1] == a);
        assert(s2[2][1] == b);
        assert(loc[2][1] == a);

        s1[2][1] = c;
        assert(s1[2][1] == c);
        assert(s2[2][1] == b);
        assert(loc[2][1] == c);

        loc[2][1] = a;
        assert(s1[2][1] == a);
        assert(s2[2][1] == b);
        assert(loc[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
