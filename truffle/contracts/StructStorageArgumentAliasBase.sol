pragma solidity >=0.5.0;

contract StructStorageArgumentAliasBase {

    struct S { int x; }

    S s;

    function test(S storage s1ref, S storage s2ref, int a, int b) internal {
        require(a != b);
        s1ref.x = a;
        s2ref.x = b;
        assert(s1ref.x == s2ref.x);
        assert(s.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(s, s, 0, 1);
    }

}
