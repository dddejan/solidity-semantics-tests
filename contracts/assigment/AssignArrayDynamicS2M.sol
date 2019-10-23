pragma solidity >=0.5.0;

contract AssignArrayDynamicS2M {

    int[] s1;

    function storToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);

        int[] memory sm = new int[](1);
        sm[0] = a;
        s1[0] = b;
        assert(sm[0] == a);
        assert(s1[0] == b);

        sm = s1; // Checking this assignemnt
        assert(s1[0] == b);
        assert(sm[0] == b);

        s1[0] = c;
        assert(s1[0] == c);
        assert(sm[0] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        storToMem(0, 1, 2);
    }
}
