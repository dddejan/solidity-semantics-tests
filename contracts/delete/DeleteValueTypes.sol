pragma solidity ^0.5.0;

contract DeleteValueTypes {
    int i;
    bool b;
    address a;

    constructor() public {
        i = 1;
        b = true;
        a = address(0x1);
        assert(i == 1);
        assert(b == true);
        assert(a == address(0x1));
        delete i;
        delete b;
        delete a;
        assert(i == 0);
        assert(b == false);
        assert(a == address(0x0));
    }
    // Boilerplate to run with truffle
    function truffleMain() external view {
    }
}
