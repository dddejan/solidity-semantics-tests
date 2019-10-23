pragma solidity >=0.5.0;

contract AssignArrayDynamicStructL2M {

    struct S { int x; }

    S[] s1;

    function locToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);

        s1[0].x = a;

        S[] storage sl1 = s1;
        S[] memory sm = new S[](1);
        sm[0].x = b;

        sm = sl1; // Checking this assignemnt

        assert(sl1[0].x == a);
        assert(sm[0].x == a);

        sl1[0].x = c;

        assert(sl1[0].x == c);
        assert(sm[0].x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(S(0));
        locToMem(0, 1, 2);
    }
}
