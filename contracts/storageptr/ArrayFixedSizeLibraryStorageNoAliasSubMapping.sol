pragma solidity >=0.5.0;

library L {

    function swap(int[2] storage a, int[2] storage b) public {
        require(a[1] != b[1]);
        int a_old = a[1];
        int b_old = b[1];
        a[1] = a[1] + b[1];
        b[1] = a[1] - b[1];
        a[1] = a[1] - b[1];
        assert(a[1] == b_old); // no alias => swap correct
        assert(b[1] == a_old); // no alias => swap correct
    }
}

contract ArrayFixedSizeLibraryStorageNoAliasSubMapping {

    int[2] s1;
    mapping(address=>int[2]) s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        s1[1] = 1;
        s2[msg.sender][1] = 2;
        L.swap(s1, s2[msg.sender]);
    }
}
