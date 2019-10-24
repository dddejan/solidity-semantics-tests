
pragma solidity >=0.5.0;

contract AssignTupleArrayFixedSizeSS2SS {
    int[2] s1;
    int[2] s2;

    function assign(int a, int b) public {
        require(a != b);
        s1[0] = a;
        s2[0] = b;
        (s1, s2) = (s2, s1); // Checking this assignment
        assert(s1[0] == a);
        assert(s2[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
