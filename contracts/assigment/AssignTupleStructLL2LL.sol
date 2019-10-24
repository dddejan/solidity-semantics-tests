
pragma solidity >=0.5.0;

contract AssignTupleStructLL2LL {
    struct S { int x; }

    S s1;
    S s2;

    function assign(int a, int b) public {
        require(a != b);
        s1.x = a;
        s2.x = b;
        S storage sl1 = s1;
        S storage sl2 = s2;
        (sl1, sl2) = (sl2, sl1); // Checking this assignment
        assert(sl1.x == b);
        assert(sl2.x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        assign(1, 2);
    }
}
