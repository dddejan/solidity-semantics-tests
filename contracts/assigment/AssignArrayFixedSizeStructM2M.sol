pragma solidity >=0.5.0;

contract AssignArrayFixedSizeStructM2M {

    struct S { int x; }

    function memToMem(int a, int b, int c) public pure {
        require(a != b && b != c && a != c);

        S[2] memory sm1;
        sm1[1] = S(a);
        S[2] memory sm2;
        sm2[1] = S(b);
        assert(sm1[1].x == a);
        assert(sm2[1].x == b);

        sm1 = sm2; // Checking this assignemnt
        assert(sm1[1].x == b);
        assert(sm2[1].x == b);

        sm1[1].x = c;
        assert(sm1[1].x == c);
        assert(sm2[1].x == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external pure {
        memToMem(0, 1, 2);
    }
}
