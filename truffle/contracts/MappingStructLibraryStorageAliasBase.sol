pragma solidity >=0.5.0;

library L {

    struct S { int x; }

    function swap(mapping(address=>S) storage a, mapping(address=>S) storage b) public {
        int a_old = a[msg.sender].x;
        int b_old = b[msg.sender].x;
        // check that they alias
        bool a_b_alias = false;
        a[msg.sender].x = b[msg.sender].x + 1;
        a_b_alias = (b[msg.sender].x == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a[msg.sender].x = a[msg.sender].x + b[msg.sender].x;
        b[msg.sender].x = a[msg.sender].x - b[msg.sender].x;
        a[msg.sender].x = a[msg.sender].x - b[msg.sender].x;
        assert(!a_b_alias || a[msg.sender].x == 0); // alias => zero
        assert(!a_b_alias || b[msg.sender].x == 0); // alias => zero
    }
}

contract MappingStructLibraryStorageAliasBase {

    mapping(address=>L.S) s1;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s1);
    }
}
