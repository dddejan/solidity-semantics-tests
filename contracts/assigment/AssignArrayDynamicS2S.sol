pragma solidity >=0.5.0;

contract AssignArrayDynamicS2S {

    int[] s1;
    int[] s2;

    function storToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.length > 0);
        require(s2.length > 0);

        s1[0] = a;
        s2[0] = b;
        assert(s1[0] == a);
        assert(s2[0] == b);

        s1 = s2; // Checking this assignemnt
        assert(s1[0] == b);
        assert(s2[0] == b);

        s2[0] = c;
        assert(s1[0] == b);
        assert(s2[0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.push(-1);
        s2.push(-1);
        storToStor(0, 1, 2);
    }
}
