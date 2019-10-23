pragma solidity >=0.5.0;

contract AssignArrayFixedSizeL2L {

    int[2] s1;
    int[2] s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1[1] = a;
        s2[1] = b;
        int[2] storage sl1 = s1;
        int[2] storage sl2 = s2;
        assert(sl1[1] == a);
        assert(sl2[1] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[1] = c;
        assert(sl1[1] == c);
        assert(sl2[1] == c);
        assert(s1[1] == a);
        assert(s2[1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
