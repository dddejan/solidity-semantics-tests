pragma solidity >=0.5.0;

contract StructStoragePointerAliasSubArrayFixedSize {

    struct S { int x; }
    struct Sub { S s; }

    S s1;
    S[2] s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x = a;
        s2[1].x = b;
        S storage s1ref = s2[1];
        S storage s2ref = s2[1];
        assert(s1ref.x == b);
        assert(s2ref.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
