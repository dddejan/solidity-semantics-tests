pragma solidity >=0.5.0;

contract ArrayFixedSizeStoragePointerArrayPop {

    int[2][] sa;
    int[2] push;

    function test(int a, int b) public {
        push[1] = a;
        sa.push(push);
        int[2] storage s = sa[sa.length-1];
        sa.pop();
        push[1] = b;
        sa.push(push);
        assert(s[1] == b);
    }

    // Boilerplate to run with truffle
    function truffleMain() external {
        test(0, 1);
    }
}
