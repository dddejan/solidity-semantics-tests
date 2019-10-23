pragma solidity >=0.5.0;

contract AssignArrayFixedSizeS2S {

    int[2] s1;
    int[2] s2;

    function storToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1] = a;
        s2[1] = b;
        assert(s1[1] == a);
        assert(s2[1] == b);

        s1 = s2; // Checking this assignemnt
        assert(s1[1] == b);
        assert(s2[1] == b);

        s2[1] = c;
        assert(s1[1] == b);
        assert(s2[1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToStor(0, 1, 2);
    }
}
