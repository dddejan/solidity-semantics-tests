
pragma solidity >=0.5.0;

contract AssignTupleStructMM2MM {
    struct S { int x; }

    function assign(int a, int b) public {
        require(a != b);
        S memory sm1 = S(a);
        S memory sm2 = S(b);
        (sm1, sm2) = (sm2, sm1); // Checking this assignment
        assert(sm1.x == b);
        assert(sm2.x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
