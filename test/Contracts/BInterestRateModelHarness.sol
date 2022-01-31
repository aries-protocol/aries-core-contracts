pragma solidity 0.5.17;

import "../../contracts/BInterestRateModel.sol";

contract BInterestRateModelHarness is BInterestRateModel {
    function calculateBorrowRate() external {
        super._calculateBorrowRate();
    }

    function setBorrowRate(uint48 _borrowRate) public {
        borrowRate = _borrowRate;
    }

    function setKinkUtilizationRate(uint256 _kinkUtilizationRate) public {
        kinkUtilizationRate = _kinkUtilizationRate;
    }

    function setTotalBorrows(uint112 _totalBorrows) public {
        totalBorrows = _totalBorrows;
    }

    function setTotalBalance(uint256 _totalBalance) public {
        totalBalance = _totalBalance;
    }

    function setAdjustSpeed(uint256 _adjustSpeed) public {
        adjustSpeed = _adjustSpeed;
    }
}
