pragma solidity 0.5.17;

import "../../contracts/AriesERC20.sol";

contract AriesERC20Harness is AriesERC20 {
    constructor(string memory _name, string memory _symbol) public AriesERC20() {
        _setName(_name, _symbol);
    }

    function mint(address to, uint256 value) public {
        super._mint(to, value);
    }

    function burn(address from, uint256 value) public {
        super._burn(from, value);
    }

    function setBalanceHarness(address account, uint256 amount) external {
        balanceOf[account] = amount;
    }
}
