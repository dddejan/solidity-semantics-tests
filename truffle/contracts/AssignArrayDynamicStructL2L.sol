pragma solidity >=0.5.0;

contract AssignArrayDynamicStructL2L {

    struct S { int x; }

    S[] s1;
    S[] s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);
        require(s2.length > 0);

        s1[0].x = a;
        s2[0].x = b;
        S[] storage sl1 = s1;
        S[] storage sl2 = s2;
        assert(sl1[0].x == a);
        assert(sl2[0].x == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[0].x = c;
        assert(sl1[0].x == c);
        assert(sl2[0].x == c);
        assert(s1[0].x == a);
        assert(s2[0].x == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(S(0));
        s2.push(S(0));
        locToLoc(0, 1, 2);
    }
}
