pragma solidity >=0.5.0;

contract AssignMappingArrayL2L {

    mapping(address=>int[]) s1;
    mapping(address=>int[]) s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1[msg.sender].push(a);
        s1[msg.sender][0] = a;
        s2[msg.sender].push(b);
        s2[msg.sender][0] = b;
        mapping(address=>int[]) storage sl1 = s1;
        mapping(address=>int[]) storage sl2 = s2;
        assert(sl1[msg.sender][0] == a);
        assert(sl2[msg.sender][0] == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[msg.sender][0] = c;
        assert(sl1[msg.sender][0] == c);
        assert(sl2[msg.sender][0] == c);
        assert(s1[msg.sender][0] == a);
        assert(s2[msg.sender][0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
