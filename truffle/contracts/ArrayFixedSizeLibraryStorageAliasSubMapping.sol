pragma solidity >=0.5.0;

library L {

    function swap(int[2] storage a, int[2] storage b) public {
        int a_old = a[1];
        int b_old = b[1];
        // check that they alias
        bool a_b_alias = false;
        a[1] = b[1] + 1;
        a_b_alias = (b[1] == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a[1] = a[1] + b[1];
        b[1] = a[1] - b[1];
        a[1] = a[1] - b[1];
        assert(!a_b_alias || a[1] == 0); // alias => zero
        assert(!a_b_alias || b[1] == 0); // alias => zero
    }
}

contract ArrayFixedSizeLibraryStorageAliasSubMapping {

    mapping(address=>int[2]) s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s2[msg.sender], s2[msg.sender]);
    }
}
