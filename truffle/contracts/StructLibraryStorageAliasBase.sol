pragma solidity >=0.5.0;

library L {

    struct S { int x; }

    function swap(S storage a, S storage b) public {
        int a_old = a.x;
        int b_old = b.x;
        // check that they alias
        bool a_b_alias = false;
        a.x = b.x + 1;
        a_b_alias = (b.x == b_old + 1);
        a_old = a_old;
        b_old = b_old;
        a.x = a.x + b.x;
        b.x = a.x - b.x;
        a.x = a.x - b.x;
        assert(!a_b_alias || a.x == 0); // alias => zero
        assert(!a_b_alias || b.x == 0); // alias => zero
    }
}

contract StructLibraryStorageAliasBase {

    L.S s1;

    // Boilerplate to run with truffle
    function truffleMain() external {
        L.swap(s1, s1);
    }
}
