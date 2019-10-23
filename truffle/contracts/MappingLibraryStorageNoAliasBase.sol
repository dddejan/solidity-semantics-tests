pragma solidity >=0.5.0;

library L {

    function swap(mapping(address=>int) storage a, mapping(address=>int) storage b) public {
        require(a[msg.sender] != b[msg.sender]);
        int a_old = a[msg.sender];
        int b_old = b[msg.sender];
        a[msg.sender] = a[msg.sender] + b[msg.sender];
        b[msg.sender] = a[msg.sender] - b[msg.sender];
        a[msg.sender] = a[msg.sender] - b[msg.sender];
        assert(a[msg.sender] == b_old); // no alias => swap correct
        assert(b[msg.sender] == a_old); // no alias => swap correct
    }
}

contract MappingLibraryStorageNoAliasBase {

    mapping(address=>int) s1;
    mapping(address=>int) s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s2);
    }
}
