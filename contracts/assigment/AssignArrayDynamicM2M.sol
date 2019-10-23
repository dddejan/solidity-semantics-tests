pragma solidity >=0.5.0;

contract AssignArrayDynamicM2M {

    function memToMem(int a, int b, int c) public pure {
        require(a != b && b != c && a != c);

        int[] memory sm1 = new int[](1);
        sm1[0] = a;
        int[] memory sm2 = new int[](1);
        sm2[0] = b;
        assert(sm1[0] == a);
        assert(sm2[0] == b);

        sm1 = sm2; // Checking this assignemnt
        assert(sm1[0] == b);
        assert(sm2[0] == b);

        sm1[0] = c;
        assert(sm1[0] == c);
        assert(sm2[0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external pure {
        memToMem(0, 1, 2);
    }
}
