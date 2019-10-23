pragma solidity >=0.5.0;

library L {

    struct S { int x; }
    struct Sub { S s; }

    function swap(S storage a, S storage b) public {
        require(a.x != b.x);
        int a_old = a.x;
        int b_old = b.x;
        a.x = a.x + b.x;
        b.x = a.x - b.x;
        a.x = a.x - b.x;
        assert(a.x == b_old); // no alias => swap correct
        assert(b.x == a_old); // no alias => swap correct
    }
}

contract ArrayFixedSizeLibraryStorageNoAliasSubStruct {

    L.S s1;
    L.Sub s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s2.s);
    }
}
