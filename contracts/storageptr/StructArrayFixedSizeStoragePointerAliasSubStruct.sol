pragma solidity >=0.5.0;

contract StructArrayFixedSizeStoragePointerAliasSubStruct {

    struct S { int[2] x; }
    struct Sub { S s; }

    S s1;
    Sub s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x[1] = a;
        s2.s.x[1] = b;
        S storage s1ref = s2.s;
        S storage s2ref = s2.s;
        assert(s1ref.x[1] == b);
        assert(s2ref.x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
