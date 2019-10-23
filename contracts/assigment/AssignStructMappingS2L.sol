pragma solidity >=0.5.0;

contract AssignStructMappingS2L {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        S storage loc = s1; // Checking this assignemnt
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);
        assert(loc.x[msg.sender] == a);

        s1.x[msg.sender] = c;
        assert(s1.x[msg.sender] == c);
        assert(s2.x[msg.sender] == b);
        assert(loc.x[msg.sender] == c);

        loc.x[msg.sender] = a;
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);
        assert(loc.x[msg.sender] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
