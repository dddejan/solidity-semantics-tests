pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMultiM2S {

    int[2][3] s1;

    function memToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        int[2][3] memory sm;
        sm[2][1] = a;

        s1 = sm; // Checking this assignemnt
        assert(s1[2][1] == a);
        assert(sm[2][1] == a);

        s1[2][1] = b;
        assert(s1[2][1] == b);
        assert(sm[2][1] == a);

        sm[2][1] = c;
        assert(s1[2][1] == b);
        assert(sm[2][1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        memToStor(0, 1, 2);
    }
}
