pragma solidity >=0.5.0;

contract AssignArrayFixedSizeM2S {

    int[2] s1;

    function memToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        int[2] memory sm;
        sm[1] = a;

        s1 = sm; // Checking this assignemnt
        assert(s1[1] == a);
        assert(sm[1] == a);

        s1[1] = b;
        assert(s1[1] == b);
        assert(sm[1] == a);

        sm[1] = c;
        assert(s1[1] == b);
        assert(sm[1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        memToStor(0, 1, 2);
    }
}
