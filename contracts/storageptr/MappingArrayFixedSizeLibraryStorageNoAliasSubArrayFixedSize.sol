pragma solidity >=0.5.0;

library L {

    function swap(mapping(address=>int[2]) storage a, mapping(address=>int[2]) storage b) public {
        require(a[msg.sender][1] != b[msg.sender][1]);
        int a_old = a[msg.sender][1];
        int b_old = b[msg.sender][1];
        a[msg.sender][1] = a[msg.sender][1] + b[msg.sender][1];
        b[msg.sender][1] = a[msg.sender][1] - b[msg.sender][1];
        a[msg.sender][1] = a[msg.sender][1] - b[msg.sender][1];
        assert(a[msg.sender][1] == b_old); // no alias => swap correct
        assert(b[msg.sender][1] == a_old); // no alias => swap correct
    }
}

contract MappingArrayFixedSizeLibraryStorageNoAliasSubArrayFixedSize {

    mapping(address=>int[2]) s1;
    mapping(address=>int[2])[2] s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1[msg.sender][1] = 1;
        s2[1][msg.sender][1] = 2;
        L.swap(s1, s2[1]);
    }
}
