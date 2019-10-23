pragma solidity >=0.5.0;

contract AssignArrayDynamicMultiL2M {

    int[][] s1;

    function locToMem(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0 && s1[0].length > 0);

        s1[0][0] = a;

        int[][] storage sl1 = s1;
        int[][] memory sm = new int[][](1);
        sm[0] = new int[](1);
        sm[0][0] = b;

        sm = sl1; // Checking this assignemnt

        assert(sl1[0][0] == a);
        assert(sm[0][0] == a);

        sl1[0][0] = c;

        assert(sl1[0][0] == c);
        assert(sm[0][0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(new int[](1));
        locToMem(0, 1, 2);
    }
}
