pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMappingS2L {

    mapping(address=>int)[2] s1;
    mapping(address=>int)[2] s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1][msg.sender] = a;
        s2[1][msg.sender] = b;
        mapping(address=>int)[2] storage loc = s1; // Checking this assignemnt
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == b);
        assert(loc[1][msg.sender] == a);

        s1[1][msg.sender] = c;
        assert(s1[1][msg.sender] == c);
        assert(s2[1][msg.sender] == b);
        assert(loc[1][msg.sender] == c);

        loc[1][msg.sender] = a;
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == b);
        assert(loc[1][msg.sender] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
