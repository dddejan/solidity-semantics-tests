pragma solidity >=0.5.0;

contract StructArrayFixedSizeStorageNoAliasSubStruct {

    struct S { int[2] x; }
    struct Sub { S s; }

    S s1;
    Sub s2;

    function test(int a, int b) public {
        s1.x[1] = a;
        s2.s.x[1] = b;
        assert(s1.x[1] == a);
        assert(s2.s.x[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
