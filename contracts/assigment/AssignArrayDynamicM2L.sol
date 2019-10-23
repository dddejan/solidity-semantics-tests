pragma solidity >=0.5.0;

contract AssignArrayDynamicM2L {

    int[] s1;

    function memToLoc(int a, int b) public {
        require(a != b);
        require(s1.length > 0);

        int[] memory sm = new int[](1);
        sm[0] = a;
        s1[0] = b;
        int[] storage sl = s1;
        assert(s1[0] == b);
        assert(sl[0] == b);
        assert(sm[0] == a);

        s1 = sm; // Checking that this assignemnt affects sl
        assert(sl[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        memToLoc(0, 1);
    }
}
