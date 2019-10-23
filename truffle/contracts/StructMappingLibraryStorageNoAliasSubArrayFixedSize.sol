pragma solidity >=0.5.0;

library L {

    struct S { mapping(address=>int) x; }
    struct Sub { S s; }

    function swap(S storage a, S storage b) public {
        require(a.x[msg.sender] != b.x[msg.sender]);
        int a_old = a.x[msg.sender];
        int b_old = b.x[msg.sender];
        a.x[msg.sender] = a.x[msg.sender] + b.x[msg.sender];
        b.x[msg.sender] = a.x[msg.sender] - b.x[msg.sender];
        a.x[msg.sender] = a.x[msg.sender] - b.x[msg.sender];
        assert(a.x[msg.sender] == b_old); // no alias => swap correct
        assert(b.x[msg.sender] == a_old); // no alias => swap correct
    }
}

contract StructMappingLibraryStorageNoAliasSubArrayFixedSize {

    L.S s1;
    L.S[2] s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s2[1]);
    }
}
