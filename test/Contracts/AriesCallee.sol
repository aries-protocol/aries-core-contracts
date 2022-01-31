pragma solidity 0.5.17;

import "../../contracts/interfaces/IAriesCallee.sol";
import "./Recipient.sol";

contract AriesCallee is IAriesCallee {
    address recipient;
    address underlying;

    constructor(address _recipient, address _underlying) public {
        recipient = _recipient;
        underlying = _underlying;
    }

    function ariesBorrow(
        address sender,
        address borrower,
        uint256 borrowAmount,
        bytes calldata data
    ) external {
        sender;
        borrower;
        borrowAmount;
        data;
        Recipient(recipient).empty(underlying, msg.sender);
    }

    function ariesRedeem(
        address sender,
        uint256 redeemAmount,
        bytes calldata data
    ) external {
        sender;
        redeemAmount;
        data;
        Recipient(recipient).empty(underlying, msg.sender);
    }
}
