pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructL2S {

    struct S { int x; }

    S[2] s1;
    S[2] s2;

    function locToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1].x = a;
        s2[1].x = b;
        assert(s1[1].x == a);
        assert(s2[1].x == b);

        S[2] storage sl1 = s1;
        s2 = sl1; // Checking this assignemnt
        assert(s1[1].x == a);
        assert(s2[1].x == a);

        sl1[1].x = c;
        assert(s1[1].x == c);
        assert(s2[1].x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToStor(0 ,1, 2);
    }
}
