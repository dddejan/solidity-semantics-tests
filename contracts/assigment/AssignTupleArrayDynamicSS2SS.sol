
pragma solidity >=0.5.0;

contract AssignTupleArrayDynamicSS2SS {
    int[] s1;
    int[] s2;

    function assign(int a, int b) public {
        require(a != b);
        require(s1.length > 0);
        require(s2.length > 0);
        s1[0] = a;
        s2[0] = b;
        (s1, s2) = (s2, s1); // Checking this assignment
        assert(s1[0] == a);
        assert(s2[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        s2.push(-1);
        assign(1, 2);
    }
}
