pragma solidity >=0.5.0;

contract AssignStructMappingS2S {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function storToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);

        s1 = s2; // Checking this assignemnt
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);

        s2.x[msg.sender] = c;
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        storToStor(0, 1, 2);
    }
}
