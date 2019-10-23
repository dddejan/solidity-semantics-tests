pragma solidity >=0.5.0;

contract AssignMappingStructS2L {

    struct S { int x; }

    mapping(address=>S) s1;
    mapping(address=>S) s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[msg.sender].x = a;
        s2[msg.sender].x = b;
        mapping(address=>S) storage loc = s1; // Checking this assignemnt
        assert(s1[msg.sender].x == a);
        assert(s2[msg.sender].x == b);
        assert(loc[msg.sender].x == a);

        s1[msg.sender].x = c;
        assert(s1[msg.sender].x == c);
        assert(s2[msg.sender].x == b);
        assert(loc[msg.sender].x == c);

        loc[msg.sender].x = a;
        assert(s1[msg.sender].x == a);
        assert(s2[msg.sender].x == b);
        assert(loc[msg.sender].x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
