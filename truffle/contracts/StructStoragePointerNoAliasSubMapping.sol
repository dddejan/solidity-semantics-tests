pragma solidity >=0.5.0;

contract StructStoragePointerNoAliasSubMapping {

    struct S { int x; }
    struct Sub { S s; }

    S s1;
    mapping(address=>S) s2;

    function test(int a, int b) public {
        s1.x = a;
        s2[msg.sender].x = b;
        S storage s1ref = s1;
        S storage s2ref = s2[msg.sender];
        assert(s1ref.x == a);
        assert(s2ref.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
