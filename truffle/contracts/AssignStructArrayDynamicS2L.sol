pragma solidity >=0.5.0;

contract AssignStructArrayDynamicS2L {

    struct S { int[] x; }

    S s1;
    S s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.x.length > 0);
        require(s2.x.length > 0);

        s1.x[0] = a;
        s2.x[0] = b;
        S storage loc = s1; // Checking this assignemnt
        assert(s1.x[0] == a);
        assert(s2.x[0] == b);
        assert(loc.x[0] == a);

        s1.x[0] = c;
        assert(s1.x[0] == c);
        assert(s2.x[0] == b);
        assert(loc.x[0] == c);

        loc.x[0] = a;
        assert(s1.x[0] == a);
        assert(s2.x[0] == b);
        assert(loc.x[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x.push(-1);
        s2.x.push(-1);
        storToLoc(0, 1, 2);
    }
}
