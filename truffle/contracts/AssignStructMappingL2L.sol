pragma solidity >=0.5.0;

contract AssignStructMappingL2L {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        S storage sl1 = s1;
        S storage sl2 = s2;
        assert(sl1.x[msg.sender] == a);
        assert(sl2.x[msg.sender] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1.x[msg.sender] = c;
        assert(sl1.x[msg.sender] == c);
        assert(sl2.x[msg.sender] == c);
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
