pragma solidity >=0.5.0;

contract AssignArrayFixedSizeL2S {

    int[2] s1;
    int[2] s2;

    function locToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1] = a;
        s2[1] = b;
        assert(s1[1] == a);
        assert(s2[1] == b);

        int[2] storage sl1 = s1;
        s2 = sl1; // Checking this assignemnt
        assert(s1[1] == a);
        assert(s2[1] == a);

        sl1[1] = c;
        assert(s1[1] == c);
        assert(s2[1] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToStor(0 ,1, 2);
    }
}
