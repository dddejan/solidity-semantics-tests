pragma solidity >=0.5.0;

library L {

    struct S { mapping(address=>int) x; }

    function swap(S storage a, S storage b) public {
        int a_old = a.x[msg.sender];
        int b_old = b.x[msg.sender];
        // check that they alias
        bool a_b_alias = false;
        a.x[msg.sender] = b.x[msg.sender] + 1;
        a_b_alias = (b.x[msg.sender] == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a.x[msg.sender] = a.x[msg.sender] + b.x[msg.sender];
        b.x[msg.sender] = a.x[msg.sender] - b.x[msg.sender];
        a.x[msg.sender] = a.x[msg.sender] - b.x[msg.sender];
        assert(!a_b_alias || a.x[msg.sender] == 0); // alias => zero
        assert(!a_b_alias || b.x[msg.sender] == 0); // alias => zero
    }
}

contract StructMappingLibraryStorageAliasSubArrayFixedSize {

    L.S[2] s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s2[1], s2[1]);
    }
}
