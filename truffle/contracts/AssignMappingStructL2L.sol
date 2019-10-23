pragma solidity >=0.5.0;

contract AssignMappingStructL2L {

    struct S { int x; }

    mapping(address=>S) s1;
    mapping(address=>S) s2;

    function locToLoc(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        s1[msg.sender].x = a;
        s2[msg.sender].x = b;
        mapping(address=>S) storage sl1 = s1;
        mapping(address=>S) storage sl2 = s2;
        assert(sl1[msg.sender].x == a);
        assert(sl2[msg.sender].x == b);

        sl1 = sl2; // Checking this assignemnt
        sl1[msg.sender].x = c;
        assert(sl1[msg.sender].x == c);
        assert(sl2[msg.sender].x == c);
        assert(s1[msg.sender].x == a);
        assert(s2[msg.sender].x == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToLoc(0, 1, 2);
    }
}
