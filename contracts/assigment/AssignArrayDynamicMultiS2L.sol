pragma solidity >=0.5.0;

contract AssignArrayDynamicMultiS2L {

    int[][] s1;
    int[][] s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0 && s1[0].length > 0);
        require(s2.length > 0 && s2[0].length > 0);

        s1[0][0] = a;
        s2[0][0] = b;
        int[][] storage loc = s1; // Checking this assignemnt
        assert(s1[0][0] == a);
        assert(s2[0][0] == b);
        assert(loc[0][0] == a);

        s1[0][0] = c;
        assert(s1[0][0] == c);
        assert(s2[0][0] == b);
        assert(loc[0][0] == c);

        loc[0][0] = a;
        assert(s1[0][0] == a);
        assert(s2[0][0] == b);
        assert(loc[0][0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(new int[](1));
        s2.push(new int[](1));
        storToLoc(0, 1, 2);
    }
}
