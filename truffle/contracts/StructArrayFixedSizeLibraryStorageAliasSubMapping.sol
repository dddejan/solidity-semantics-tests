pragma solidity >=0.5.0;

library L {

    struct S { int[2] x; }
    struct Sub { S s; }

    function swap(S storage a, S storage b) public {
        int a_old = a.x[1];
        int b_old = b.x[1];
        // check that they alias
        bool a_b_alias = false;
        a.x[1] = b.x[1] + 1;
        a_b_alias = (b.x[1] == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a.x[1] = a.x[1] + b.x[1];
        b.x[1] = a.x[1] - b.x[1];
        a.x[1] = a.x[1] - b.x[1];
        assert(!a_b_alias || a.x[1] == 0); // alias => zero
        assert(!a_b_alias || b.x[1] == 0); // alias => zero
    }
}

contract StructArrayFixedSizeLibraryStorageAliasSubMapping {

    L.Sub s2;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s2.s, s2.s);
    }
}
