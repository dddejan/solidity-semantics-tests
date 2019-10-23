pragma solidity >=0.5.0;

contract AssignArrayDynamicL2L {

    int[] s1;
    int[] s2;

    function locToLoc(int a, int b, int c) public {
        require(s1.length > 0);
        require(s2.length > 0);
        require(a != b && b != c && a != c);
        s1[0] = a;
        s2[0] = b;
        int[] storage sl1 = s1;
        int[] storage sl2 = s2;
        assert(sl1[0] == a);
        assert(sl2[0] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[0] = c;
        assert(sl1[0] == c);
        assert(sl2[0] == c);
        assert(s1[0] == a);
        assert(s2[0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        s2.push(-1);
        locToLoc(0, 1, 2);
    }
}
