pragma solidity >=0.5.0;

contract AssignStructArrayFixedSizeL2M {

    struct S { int[2][3] x; }

    S s1;

    function locToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1.x[2][1] = a;

        S storage sl1 = s1;
        S memory sm;
        sm.x[2][1] = b;

        sm = sl1; // Checking this assignemnt

        assert(sl1.x[2][1] == a);
        assert(sm.x[2][1] == a);

        sl1.x[2][1] = c;

        assert(sl1.x[2][1] == c);
        assert(sm.x[2][1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToMem(0, 1, 2);
    }
}
