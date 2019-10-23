pragma solidity >=0.5.0;

contract AssignArrayFixedSizeL2M {

    int[2] s1;

    function locToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1] = a;

        int[2] storage sl1 = s1;
        int[2] memory sm;
        sm[1] = b;

        sm = sl1; // Checking this assignemnt

        assert(sl1[1] == a);
        assert(sm[1] == a);

        sl1[1] = c;

        assert(sl1[1] == c);
        assert(sm[1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToMem(0, 1, 2);
    }
}
