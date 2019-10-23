pragma solidity >=0.5.0;

contract StructStorageNoAliasSubMapping {

    struct S { int x; }
    struct Sub { S s; }

    S s1;
    mapping(address=>S) s2;

    function test(int a, int b) public {
        s1.x = a;
        s2[msg.sender].x = b;
        assert(s1.x == a);
        assert(s2[msg.sender].x == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }

}
