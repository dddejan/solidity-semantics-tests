pragma solidity >=0.5.0;

contract AssignArrayFixedSizeS2M {

    int[2] s1;

    function storToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        int[2] memory sm;
        sm[1] = a;
        s1[1] = b;
        assert(sm[1] == a);
        assert(s1[1] == b);

        sm = s1; // Checking this assignemnt
        assert(s1[1] == b);
        assert(sm[1] == b);

        s1[1] = c;
        assert(s1[1] == c);
        assert(sm[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToMem(0, 1, 2);
    }
}
