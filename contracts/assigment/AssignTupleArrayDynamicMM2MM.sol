
pragma solidity >=0.5.0;

contract AssignTupleArrayDynamicMM2MM {
    function assign(int a, int b) public {
        require(a != b);
        int[] memory sm1 = new int[](2);
        int[] memory sm2 = new int[](2);
        sm1[0] = a;
        sm2[0] = b;

        (sm1, sm2) = (sm2, sm1); // Checking this assignment
        assert(sm1[0] == b);
        assert(sm2[0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
