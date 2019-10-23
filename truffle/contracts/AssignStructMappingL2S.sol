pragma solidity >=0.5.0;

contract AssignStructMappingL2S {

    struct S { mapping(address=>int) x; }

    S s1;
    S s2;

    function locToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);

        s1.x[msg.sender] = a;
        s2.x[msg.sender] = b;
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);

        S storage sl1 = s1;
        s2 = sl1; // Checking this assignemnt
        assert(s1.x[msg.sender] == a);
        assert(s2.x[msg.sender] == b);

        sl1.x[msg.sender] = c;
        assert(s1.x[msg.sender] == c);
        assert(s2.x[msg.sender] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        locToStor(0 ,1, 2);
    }
}
