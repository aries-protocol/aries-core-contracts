pragma solidity 0.5.17;

import "../../contracts/Borrowable.sol";
import "../../contracts/interfaces/ICollateral.sol";

contract BorrowableHarness is Borrowable {
    function setUnderlyingHarness(address _underlying) external {
        underlying = _underlying;
    }

    function setFactoryHarness(address _factory) external {
        factory = _factory;
    }

    function setCollateralHarness(address _collateral) external {
        collateral = _collateral;
    }

    bool useMockBorrowBalance;
    mapping(address => uint256) public _borrowBalance;

    function borrowBalance(address borrower) public view returns (uint256) {
        if (useMockBorrowBalance) return _borrowBalance[borrower];
        return super.borrowBalance(borrower);
    }

    function setBorrowBalanceHarness(address borrower, uint256 amount) external {
        useMockBorrowBalance = true;
        _borrowBalance[borrower] = amount;
    }

    function setBorrowBalances(
        address borrower,
        uint112 principal,
        uint112 interestIndex
    ) external {
        borrowBalances[borrower].principal = principal;
        borrowBalances[borrower].interestIndex = interestIndex;
    }

    function setBorrowIndex(uint112 _borrowIndex) external {
        borrowIndex = _borrowIndex;
    }

    function seizeHarness(
        address collateral,
        address liquidator,
        address borrower,
        uint256 repayAmount
    ) external returns (uint256) {
        return ICollateral(collateral).seize(liquidator, borrower, repayAmount);
    }

    function setTotalBalance(uint256 _totalBalance) public {
        totalBalance = _totalBalance;
    }

    function setTotalBorrows(uint112 _totalBorrows) public {
        totalBorrows = _totalBorrows;
    }

    function setTotalSupply(uint256 _totalSupply) public {
        totalSupply = _totalSupply;
    }

    function setBorrowRate(uint48 _borrowRate) public {
        borrowRate = _borrowRate;
    }

    function setReserveFactor(uint256 _reserveFactor) public {
        reserveFactor = _reserveFactor;
    }

    uint32 _blockTimestamp;

    function getBlockTimestamp() public view returns (uint32) {
        return _blockTimestamp;
    }

    function setBlockTimestamp(uint256 blockTimestamp) public {
        _blockTimestamp = uint32(blockTimestamp % 2**32);
    }

    function setExchangeRateLast(uint128 _exchangeRateLast) public {
        exchangeRateLast = _exchangeRateLast;
    }

    function setBorrowTracker(address _borrowTracker) public {
        borrowTracker = _borrowTracker;
    }
}
