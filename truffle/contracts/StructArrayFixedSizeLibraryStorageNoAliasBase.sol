pragma solidity >=0.5.0;

library L {

    struct S { int[2] x; }

    function swap(S storage a, S storage b) public {
        require(a.x[1] != b.x[1]);
        int a_old = a.x[1];
        int b_old = b.x[1];
        a.x[1] = a.x[1] + b.x[1];
        b.x[1] = a.x[1] - b.x[1];
        a.x[1] = a.x[1] - b.x[1];
        assert(a.x[1] == b_old); // no alias => swap correct
        assert(b.x[1] == a_old); // no alias => swap correct
    }
}

contract StructArrayFixedSizeLibraryStorageNoAliasBase {

    L.S s1;
    L.S s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s2);
    }
}
