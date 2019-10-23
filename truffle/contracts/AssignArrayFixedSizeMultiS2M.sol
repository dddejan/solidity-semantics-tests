pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMultiS2M {

    int[2][3] s1;

    function storToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        int[2][3] memory sm;
        sm[2][1] = a;
        s1[2][1] = b;
        assert(sm[2][1] == a);
        assert(s1[2][1] == b);

        sm = s1; // Checking this assignemnt
        assert(s1[2][1] == b);
        assert(sm[2][1] == b);

        s1[2][1] = c;
        assert(s1[2][1] == c);
        assert(sm[2][1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToMem(0, 1, 2);
    }
}
