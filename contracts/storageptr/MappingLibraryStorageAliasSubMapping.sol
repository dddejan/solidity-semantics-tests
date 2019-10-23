pragma solidity >=0.5.0;

library L {

    function swap(mapping(address=>int) storage a, mapping(address=>int) storage b) public {
        int a_old = a[msg.sender];
        int b_old = b[msg.sender];
        // check that they alias
        bool a_b_alias = false;
        a[msg.sender] = b[msg.sender] + 1;
        a_b_alias = (b[msg.sender] == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a[msg.sender] = a[msg.sender] + b[msg.sender];
        b[msg.sender] = a[msg.sender] - b[msg.sender];
        a[msg.sender] = a[msg.sender] - b[msg.sender];
        assert(!a_b_alias || a[msg.sender] == 0); // alias => zero
        assert(!a_b_alias || b[msg.sender] == 0); // alias => zero
    }
}

contract MappingLibraryStorageAliasSubMapping {

    mapping(address=>mapping(address=>int)) s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s2[msg.sender], s2[msg.sender]);
    }
}
