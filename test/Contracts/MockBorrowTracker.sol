pragma solidity 0.5.17;

import "../../contracts/interfaces/IBorrowTracker.sol";
import "../../contracts/libraries/SafeMath.sol";

contract MockBorrowTracker is IBorrowTracker {
    using SafeMath for uint256;

    constructor() public {}

    mapping(address => uint256) public relativeBorrow;
    uint256 public totalRelativeBorrows;

    function trackBorrow(
        address borrower,
        uint256 borrowBalance,
        uint256 borrowIndex
    ) external {
        uint256 _relativeBorrowPrior = relativeBorrow[borrower];
        uint256 _relativeBorrow = borrowBalance.mul(2**128).div(borrowIndex);
        relativeBorrow[borrower] = _relativeBorrow;
        if (_relativeBorrow > _relativeBorrowPrior) {
            uint256 increaseAmount = _relativeBorrow - _relativeBorrowPrior;
            totalRelativeBorrows = totalRelativeBorrows.add(increaseAmount);
        } else {
            uint256 decreaseAmount = _relativeBorrowPrior - _relativeBorrow;
            totalRelativeBorrows = totalRelativeBorrows > decreaseAmount ? totalRelativeBorrows - decreaseAmount : 0;
        }
    }

    function borrowPercentage(address borrower) external view returns (uint256) {
        if (totalRelativeBorrows == 0) return 0;
        return relativeBorrow[borrower].mul(1e18).div(totalRelativeBorrows);
    }
}
