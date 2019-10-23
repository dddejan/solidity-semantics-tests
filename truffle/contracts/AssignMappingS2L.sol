pragma solidity >=0.5.0;

contract AssignMappingS2L {

    mapping(address=>int) s1;
    mapping(address=>int) s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[msg.sender] = a;
        s2[msg.sender] = b;
        mapping(address=>int) storage loc = s1; // Checking this assignemnt
        assert(s1[msg.sender] == a);
        assert(s2[msg.sender] == b);
        assert(loc[msg.sender] == a);

        s1[msg.sender] = c;
        assert(s1[msg.sender] == c);
        assert(s2[msg.sender] == b);
        assert(loc[msg.sender] == c);

        loc[msg.sender] = a;
        assert(s1[msg.sender] == a);
        assert(s2[msg.sender] == b);
        assert(loc[msg.sender] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
