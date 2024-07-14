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

pragma solidity 0.8.20;

interface IDDPool {
    error NotAuthorized();

    /**
     * @notice Deposit assets (ZAI) in the external pool.
     * @dev If the external pool requires a different amount to be passed in, the
     * conversion should occur here as the Hub passes ZAI amounts.
     * @dev msg.sender must be the hub.
     * @param amount amount in asset (ZAI) terms that we want to deposit
     */
    function deposit(uint256 amount) external;

    /**
     * @notice Withdraw assets (ZAI) from the external pool.
     * @dev If the external pool requires a different amount to be passed in
     * the conversion should occur here as the Hub passes ZAI amounts.
     * @dev msg.sender must be the hub.
     * @param amount amount in asset (ZAI) terms that we want to withdraw
     */
    function withdraw(uint256 amount) external;

    /**
     * @notice Exit proportional amount of shares.
     * @dev If the external pool/token contract requires a different amount to be
     * passed in the conversion should occur here as the Hub passes Gem [wad]
     * amounts.
     * @dev msg.sender must be the hub.
     * @param dst address that should receive the redeemable tokens
     * @param wad amount in Gem terms that we want to withdraw
     */
    function exit(address dst, uint256 wad) external;

    /**
     * @notice Transfer all assets from this pool.
     * @dev msg.sender must be authorized.
     * @param destination address that should receive the assets.
     */
    function quit(address destination) external;

    /**
     * @notice Some external pools require actions before debt changes
     */
    function preDebtChange() external;

    /**
     * @notice Some external pools require actions after debt changes
     */
    function postDebtChange() external;

    /**
     * @notice Balance of assets this pool "owns".
     * @dev This could be greater than the amount the pool can withdraw due to lack of liquidity.
     * @return uint256 number of assets in ZAI
     */
    function assetBalance() external view returns (uint256);

    /**
     * @notice Maximum number of assets the pool could deposit at present.
     * @return uint256 number of assets in ZAI
     */
    function maxDeposit() external view returns (uint256);

    /**
     * @notice Maximum number of assets the pool could withdraw at present.
     * @return uint256 number of assets in ZAI
     */
    function maxWithdraw() external view returns (uint256);

    /**
     * @notice returns address of redeemable tokens (if any)
     */
    function redeemable() external view returns (address);
}