pragma solidity >=0.5.0;

contract StructStorageNoAliasBase {

    struct S { int x; }

    S s1;
    S s2;

    function test(int a, int b) public {
        s1.x = a;
        s2.x = b;
        assert(s1.x == a);
        assert(s2.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
