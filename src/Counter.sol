//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

//NORMAL TESTING
contract TestCounter is Counter {
    function echidna_test_pass() public pure returns (bool) {
        return true;
    }

    function echidna_test_count() public view returns (bool) {
        return count <= 9;
    }
}

//ASSERTION TESTING
contract TestAssert is Counter {
    //this will fail
    function test_assert(uint _c) external pure {
        assert(_c <= 9);
    }

    function abs(uint x, uint y) private pure returns(uint) {
        if( x >= y){
            return x - y;
        } 
        return y - x;
    }

    //This shoudl pass 
    function test_abs(uint x, uint y) external pure {
        uint z = abs(x, y);
        if(x >= y){
            assert(z <=x);
        } else {
            assert(z <= y);
        }
    }

}