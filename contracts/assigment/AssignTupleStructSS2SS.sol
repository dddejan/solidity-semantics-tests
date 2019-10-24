
pragma solidity >=0.5.0;

contract AssignTupleStructSS2SS {
    struct S { int x; }

    S s1;
    S s2;

    function assign(int a, int b) public {
        require(a != b);
        s1.x = a;
        s2.x = b;
        (s1, s2) = (s2, s1); // Checking this assignment
        assert(s1.x == a);
        assert(s2.x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
