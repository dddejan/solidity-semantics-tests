pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructS2S {

    struct S { int x; }

    S[2] s1;
    S[2] s2;

    function storToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1].x = a;
        s2[1].x = b;
        assert(s1[1].x == a);
        assert(s2[1].x == b);

        s1 = s2; // Checking this assignemnt
        assert(s1[1].x == b);
        assert(s2[1].x == b);

        s2[1].x = c;
        assert(s1[1].x == b);
        assert(s2[1].x == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToStor(0, 1, 2);
    }
}
