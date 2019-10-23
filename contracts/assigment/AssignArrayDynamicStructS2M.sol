pragma solidity >=0.5.0;

contract AssignArrayDynamicStructS2M {

    struct S { int x; }

    S[] s1;

    function storToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);

        S[] memory sm = new S[](1);
        sm[0].x = a;
        s1[0].x = b;
        assert(sm[0].x == a);
        assert(s1[0].x == b);

        sm = s1; // Checking this assignemnt
        assert(s1[0].x == b);
        assert(sm[0].x == b);

        s1[0].x = c;
        assert(s1[0].x == c);
        assert(sm[0].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(S(0));
        storToMem(0, 1, 2);
    }
}
