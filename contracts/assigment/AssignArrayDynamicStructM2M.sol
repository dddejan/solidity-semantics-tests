pragma solidity >=0.5.0;

contract AssignArrayDynamicStructM2M {

    struct S { int x; }

    function memToMem(int a, int b, int c) public pure {
        require(a != b && b != c && a != c);

        S[] memory sm1 = new S[](1);
        sm1[0].x = a;
        S[] memory sm2 = new S[](1);
        sm2[0].x = b;
        assert(sm1[0].x == a);
        assert(sm2[0].x == b);

        sm1 = sm2; // Checking this assignemnt
        assert(sm1[0].x == b);
        assert(sm2[0].x == b);

        sm1[0].x = c;
        assert(sm1[0].x == c);
        assert(sm2[0].x == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external pure {
        memToMem(0, 1, 2);
    }
}
