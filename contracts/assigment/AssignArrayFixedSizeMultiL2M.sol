pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMultiL2M {

    int[2][3] s1;

    function locToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[2][1] = a;

        int[2][3] storage sl1 = s1;
        int[2][3] memory sm;
        sm[2][1] = b;

        sm = sl1; // Checking this assignemnt

        assert(sl1[2][1] == a);
        assert(sm[2][1] == a);

        sl1[2][1] = c;

        assert(sl1[2][1] == c);
        assert(sm[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToMem(0, 1, 2);
    }
}
