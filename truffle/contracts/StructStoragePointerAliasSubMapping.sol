pragma solidity >=0.5.0;

contract StructStoragePointerAliasSubMapping {

    struct S { int x; }
    struct Sub { S s; }

    S s1;
    mapping(address=>S) s2;

    function test(int a, int b) public {
        require(a != b);
        s1.x = a;
        s2[msg.sender].x = b;
        S storage s1ref = s2[msg.sender];
        S storage s2ref = s2[msg.sender];
        assert(s1ref.x == b);
        assert(s2ref.x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
