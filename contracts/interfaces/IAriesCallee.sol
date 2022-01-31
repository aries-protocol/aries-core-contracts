pragma solidity >=0.5.0;

interface IAriesCallee {
    function ariesBorrow(
        address sender,
        address borrower,
        uint256 borrowAmount,
        bytes calldata data
    ) external;

    function ariesRedeem(
        address sender,
        uint256 redeemAmount,
        bytes calldata data
    ) external;
}
