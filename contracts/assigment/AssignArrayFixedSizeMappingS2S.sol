pragma solidity >=0.5.0;

contract AssignArrayFixedSizeMappingS2S {

    mapping(address=>int)[2] s1;
    mapping(address=>int)[2] s2;

    function storToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1[1][msg.sender] = a;
        s2[1][msg.sender] = b;
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == b);

        s1 = s2; // Checking this assignemnt
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == b);

        s2[1][msg.sender] = c;
        assert(s1[1][msg.sender] == a);
        assert(s2[1][msg.sender] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToStor(0, 1, 2);
    }
}
