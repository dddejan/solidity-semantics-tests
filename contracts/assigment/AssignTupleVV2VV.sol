
pragma solidity >=0.5.0;

contract AssignTupleVV2VV {
    int x;
    int y;

    function assign(int a, int b) public {
        require(a != b);
        x = a;
        y = b;
        (x, y) = (y, x); // Checking this assignment
        assert(x == b);
        assert(y == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
