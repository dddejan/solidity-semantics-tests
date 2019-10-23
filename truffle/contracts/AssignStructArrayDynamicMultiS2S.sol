pragma solidity >=0.5.0;

contract AssignStructArrayDynamicMultiS2S {

    struct S { int[][] x; }

    S s1;
    S s2;

    function storToStor(int a, int b, int c) public {
        require(a != b && b != c && a != c);
        require(s1.x.length > 0 && s1.x[0].length > 0);
        require(s2.x.length > 0 && s2.x[0].length > 0);

        s1.x[0][0] = a;
        s2.x[0][0] = b;
        assert(s1.x[0][0] == a);
        assert(s2.x[0][0] == b);

        s1 = s2; // Checking this assignemnt
        assert(s1.x[0][0] == b);
        assert(s2.x[0][0] == b);

        s2.x[0][0] = c;
        assert(s1.x[0][0] == b);
        assert(s2.x[0][0] == c);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x.push(new int[](1));
        s1.x[0].push(-1);
        s2.x.push(new int[](1));
        s2.x[0].push(-1);
        storToStor(0, 1, 2);
    }
}
