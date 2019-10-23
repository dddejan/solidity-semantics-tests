pragma solidity >=0.5.0;

contract AssignArrayDynamicS2L {

    int[] s1;
    int[] s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);
        require(s2.length > 0);

        s1[0] = a;
        s2[0] = b;
        int[] storage loc = s1; // Checking this assignemnt
        assert(s1[0] == a);
        assert(s2[0] == b);
        assert(loc[0] == a);

        s1[0] = c;
        assert(s1[0] == c);
        assert(s2[0] == b);
        assert(loc[0] == c);

        loc[0] = a;
        assert(s1[0] == a);
        assert(s2[0] == b);
        assert(loc[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        s2.push(-1);
        storToLoc(0, 1, 2);
    }
}
