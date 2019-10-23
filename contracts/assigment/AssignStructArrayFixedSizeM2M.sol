pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeM2M {
    struct S { int[2][3] x; }

    function memToMem(int a, int b, int c) public pure {
        require(a != b && b != c && a != c);

        S memory sm1;
        sm1.x[2][1] = a;
        S memory sm2;
        sm2.x[2][1] = b;
        assert(sm1.x[2][1] == a);
        assert(sm2.x[2][1] == b);

        sm1 = sm2; // Checking this assignemnt
        assert(sm1.x[2][1] == b);
        assert(sm2.x[2][1] == b);

        sm1.x[2][1] = c;
        assert(sm1.x[2][1] == c);
        assert(sm2.x[2][1] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external pure {
        memToMem(0, 1, 2);
    }
}
