pragma solidity >=0.5.0;

contract StructStorageArgumentNoAliasBase {

    struct S { int x; }

    S s1;
    S s2;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        require(s1ref.x != s2ref.x);
        s1ref.x = a;
        s2ref.x = b;
        assert(s1.x != s2.x);
        assert(s1.x == a || s1.x == b);
        assert(s2.x == a || s2.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1.x = -1;
        s2.x = -2;
        test(s1, s2, 0, 1);
    }

}
