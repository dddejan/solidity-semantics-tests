pragma solidity >=0.5.0;

contract AssignMappingNestedL2L {

    mapping(address=>mapping(address=>int)) s1;
    mapping(address=>mapping(address=>int)) s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1[msg.sender][msg.sender] = a;
        s2[msg.sender][msg.sender] = b;
        mapping(address=>mapping(address=>int)) storage sl1 = s1;
        mapping(address=>mapping(address=>int)) storage sl2 = s2;
        assert(sl1[msg.sender][msg.sender] == a);
        assert(sl2[msg.sender][msg.sender] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[msg.sender][msg.sender] = c;
        assert(sl1[msg.sender][msg.sender] == c);
        assert(sl2[msg.sender][msg.sender] == c);
        assert(s1[msg.sender][msg.sender] == a);
        assert(s2[msg.sender][msg.sender] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
