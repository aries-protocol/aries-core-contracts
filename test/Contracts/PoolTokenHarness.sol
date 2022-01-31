pragma solidity 0.5.17;

import "../../contracts/PoolToken.sol";

contract PoolTokenHarness is PoolToken {
    function setUnderlying(address _underlying) public {
        underlying = _underlying;
    }
}
