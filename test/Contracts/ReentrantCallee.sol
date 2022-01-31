pragma solidity 0.5.17;

import "../../contracts/interfaces/IBorrowable.sol";
import "../../contracts/interfaces/ICollateral.sol";
import "../../contracts/interfaces/IAriesCallee.sol";

contract ReentrantCallee is IAriesCallee {
    constructor() public {}

    function ariesBorrow(
        address sender,
        address borrower,
        uint256 borrowAmount,
        bytes calldata data
    ) external {
        sender;
        borrower;
        borrowAmount;
        address a = address(this);
        uint256 i = abi.decode(data, (uint256));
        require(i != 0, "TEST");
        if (i == 1) IBorrowable(msg.sender).mint(a);
        else if (i == 2) IBorrowable(msg.sender).redeem(a);
        else if (i == 3) IBorrowable(msg.sender).skim(a);
        else if (i == 4) IBorrowable(msg.sender).sync();
        else if (i == 5) IBorrowable(msg.sender).borrow(a, a, 0, new bytes(0));
        else if (i == 6) IBorrowable(msg.sender).liquidate(a, a);
        else if (i == 7) IBorrowable(msg.sender).underlying();
    }

    function ariesRedeem(
        address sender,
        uint256 redeemAmount,
        bytes calldata data
    ) external {
        sender;
        redeemAmount;
        address a = address(this);
        uint256 i = abi.decode(data, (uint256));
        require(i != 0, "TEST");
        if (i == 1) ICollateral(msg.sender).mint(a);
        else if (i == 2) ICollateral(msg.sender).redeem(a);
        else if (i == 3) ICollateral(msg.sender).skim(a);
        else if (i == 4) ICollateral(msg.sender).sync();
        else if (i == 5) ICollateral(msg.sender).flashRedeem(a, 0, new bytes(0));
    }
}
