pragma solidity >=0.5.0;

contract AssignStructArrayDynamicL2L {

    struct S { int[] x; }

    S s1;
    S s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.x.length > 0);
        require(s2.x.length > 0);

        s1.x[0] = a;
        s2.x[0] = b;
        S storage sl1 = s1;
        S storage sl2 = s2;
        assert(sl1.x[0] == a);
        assert(sl2.x[0] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1.x[0] = c;
        assert(sl1.x[0] == c);
        assert(sl2.x[0] == c);
        assert(s1.x[0] == a);
        assert(s2.x[0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x.push(-1);
        s2.x.push(-1);
        locToLoc(0, 1, 2);
    }
}
