// SPDX-License-Identifier: GPL-3.0

// ███╗   ███╗ █████╗ ██╗  ██╗ █████╗
// ████╗ ████║██╔══██╗██║  ██║██╔══██╗
// ██╔████╔██║███████║███████║███████║
// ██║╚██╔╝██║██╔══██║██╔══██║██╔══██║
// ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║
// ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝

// Website: https://maha.xyz
// Discord: https://discord.gg/mahadao
// Twitter: https://twitter.com/mahaxyz_

pragma solidity 0.8.19;

import {IVotes} from "@openzeppelin/contracts/governance/utils/IVotes.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {ILocker} from "./ILocker.sol";

interface IOmnichainStaking is IVotes {
    // An omni-chain staking contract that allows users to stake their veNFT
    // and get some voting power. Once staked the voting power is available cross-chain.

    function unstakeToken(uint256 tokenId) external;

    // function totalSupply() external view returns (uint256);

    // function balanceOf(address account) external view returns (uint256);

    function rewardRate() external view returns (uint256);

    function getLockedNftDetails(
        address _user
    ) external view returns (uint256[] memory, ILocker.LockedBalance[] memory);

    function getTokenPower(
        uint256 amount
    ) external view returns (uint256 power);

    error InvalidUnstaker(address, address);

    event LpOracleSet(address indexed oldLpOracle, address indexed newLpOracle);
    event ZeroAggregatorSet(
        address indexed oldZeroAggregator,
        address indexed newZeroAggregator
    );
    event RewardPaid(address indexed user, uint256 reward);
    event RewardAdded(uint256 reward);
    event Recovered(address token, uint256 amount);
    event RewardsDurationUpdated(uint256 newDuration);
    event TokenLockerUpdated(address previousLocker, address _tokenLocker);
    event RewardsTokenUpdated(address previousToken, address _zeroToken);
    event PoolVoterUpdated(address previousVoter, address _poolVoter);
}
