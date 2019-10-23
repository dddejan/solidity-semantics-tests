pragma solidity >=0.5.0;

contract AssignMappingArrayS2L {

    mapping(address=>int[]) s1;
    mapping(address=>int[]) s2;

    function storToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[msg.sender].push(a);
        s1[msg.sender][0] = a;
        s2[msg.sender].push(b);
        s2[msg.sender] [0] = b;
        mapping(address=>int[]) storage loc = s1; // Checking this assignemnt
        assert(s1[msg.sender][0] == a);
        assert(s2[msg.sender][0] == b);
        assert(loc[msg.sender][0] == a);

        s1[msg.sender].push(c);
        s1[msg.sender][0] = c;
        assert(s1[msg.sender][0] == c);
        assert(s2[msg.sender][0] == b);
        assert(loc[msg.sender][0] == c);

        loc[msg.sender][0] = a;
        assert(s1[msg.sender][0] == a);
        assert(s2[msg.sender][0] == b);
        assert(loc[msg.sender][0] == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToLoc(0, 1, 2);
    }
}
