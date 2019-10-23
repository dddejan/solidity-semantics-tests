pragma solidity >=0.5.0;

library L {

    struct S { int x; }

    function swap(mapping(address=>S) storage a, mapping(address=>S) storage b) public {
        require(a[msg.sender].x != b[msg.sender].x);
        int a_old = a[msg.sender].x;
        int b_old = b[msg.sender].x;
        a[msg.sender].x = a[msg.sender].x + b[msg.sender].x;
        b[msg.sender].x = a[msg.sender].x - b[msg.sender].x;
        a[msg.sender].x = a[msg.sender].x - b[msg.sender].x;
        assert(a[msg.sender].x == b_old); // no alias => swap correct
        assert(b[msg.sender].x == a_old); // no alias => swap correct
    }
}

contract MappingStructLibraryStorageNoAliasBase {

    mapping(address=>L.S) s1;
    mapping(address=>L.S) s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s2);
    }
}
