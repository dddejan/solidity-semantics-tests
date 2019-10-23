pragma solidity >=0.5.0;

contract StructStoragePointerAlias {

    struct S { int x; }

    S s1;
    S s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x = a;
        s2.x = b;
        S storage s1ref = s1;
        S storage s2ref = s1;
        assert(s1ref.x == a);
        assert(s2ref.x == a);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
