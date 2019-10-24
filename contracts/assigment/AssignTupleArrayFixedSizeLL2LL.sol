
pragma solidity >=0.5.0;

contract AssignTupleArrayFixedSizeLL2LL {
    int[2] s1;
    int[2] s2;

    function assign(int a, int b) public {
        require(a != b);
        s1[0] = a;
        s2[0] = b;
        int[2] storage sl1 = s1;
        int[2] storage sl2 = s2;
        (sl1, sl2) = (sl2, sl1); // Checking this assignment
        assert(sl1[0] == b);
        assert(sl2[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
