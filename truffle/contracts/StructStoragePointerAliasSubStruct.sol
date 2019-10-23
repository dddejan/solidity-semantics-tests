pragma solidity >=0.5.0;

contract StructStoragePointerAliasSubStruct {

    struct S { int x; }
    struct Sub { S s; }

    S s1;
    Sub s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x = a;
        s2.s.x = b;
        S storage s1ref = s2.s;
        S storage s2ref = s2.s;
        assert(s1ref.x == b);
        assert(s2ref.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
