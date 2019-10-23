pragma solidity >=0.5.0;

contract AssignArrayDynamicStructL2S {

    struct S { int x; }

    S[] s1;
    S[] s2;

    function locToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);
        require(s2.length > 0);

        s1[0].x = a;
        s2[0].x = b;
        assert(s1[0].x == a);
        assert(s2[0].x == b);

        S[] storage sl1 = s1;
        s2 = sl1; // Checking this assignemnt
        assert(s1[0].x == a);
        assert(s2[0].x == a);

        sl1[0].x = c;
        assert(s1[0].x == c);
        assert(s2[0].x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(S(0));
        s2.push(S(0));
        locToStor(0 ,1, 2);
    }
}
