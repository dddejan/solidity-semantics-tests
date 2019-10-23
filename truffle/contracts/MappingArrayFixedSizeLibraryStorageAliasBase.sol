pragma solidity >=0.5.0;

library L {

    function swap(mapping(address=>int[2]) storage a, mapping(address=>int[2]) storage b) public {
        int a_old = a[msg.sender][1];
        int b_old = b[msg.sender][1];
        // check that they alias
        bool a_b_alias = false;
        a[msg.sender][1] = b[msg.sender][1] + 1;
        a_b_alias = (b[msg.sender][1] == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a[msg.sender][1] = a[msg.sender][1] + b[msg.sender][1];
        b[msg.sender][1] = a[msg.sender][1] - b[msg.sender][1];
        a[msg.sender][1] = a[msg.sender][1] - b[msg.sender][1];
        assert(!a_b_alias || a[msg.sender][1] == 0); // alias => zero
        assert(!a_b_alias || b[msg.sender][1] == 0); // alias => zero
    }
}

contract MappingArrayFixedSizeLibraryStorageAliasBase {

    mapping(address=>int[2]) s1;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s1);
    }
}
