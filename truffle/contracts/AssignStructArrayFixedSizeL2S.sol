pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeL2S {

    struct S { int[2][3] x; }

    S s1;
    S s2;

    function locToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1.x[2][1] = a;
        s2.x[2][1] = b;
        assert(s1.x[2][1] == a);
        assert(s2.x[2][1] == b);

        S storage sl1 = s1;
        s2 = sl1; // Checking this assignemnt
        assert(s1.x[2][1] == a);
        assert(s2.x[2][1] == a);

        sl1.x[2][1] = c;
        assert(s1.x[2][1] == c);
        assert(s2.x[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToStor(0 ,1, 2);
    }
}
