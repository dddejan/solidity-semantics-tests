pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructL2M {

    struct S { int x; }

    S[2] s1;

    function locToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1].x = a;

        S[2] storage sl1 = s1;
        S[2] memory sm;
        sm[1] = S(b);

        sm = sl1; // Checking this assignemnt

        assert(sl1[1].x == a);
        assert(sm[1].x == a);

        sl1[1].x = c;

        assert(sl1[1].x == c);
        assert(sm[1].x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToMem(0, 1, 2);
    }
}
