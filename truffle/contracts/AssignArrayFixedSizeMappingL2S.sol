pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMappingL2S {

    mapping(address=>int)[2] s1;
    mapping(address=>int)[2] s2;

    function locToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1][msg.sender] = a;
        s2[1][msg.sender] = b;
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == b);

        mapping(address=>int)[2] storage sl1 = s1;
        s2 = sl1; // Checking this assignemnt
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == b);

        sl1[1][msg.sender] = c;
        assert(s1[1][msg.sender] == c);
        assert(s2[1][msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToStor(0 ,1, 2);
    }
}
