pragma solidity >=0.5.0;

contract AssignArrayDynamicM2S {

    int[] s1;

    function memToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        int[] memory sm = new int[](1);
        sm[0] = a;

        s1 = sm; // Checking this assignemnt
        assert(s1[0] == a);
        assert(sm[0] == a);

        s1[0] = b;
        assert(s1[0] == b);
        assert(sm[0] == a);

        sm[0] = c;
        assert(s1[0] == b);
        assert(sm[0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        memToStor(0, 1, 2);
    }
}
