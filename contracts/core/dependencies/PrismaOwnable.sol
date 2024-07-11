// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.19;

import "../interfaces/IPrismaCore.sol";

/**
    @title Prisma Ownable
    @notice Contracts inheriting `PrismaOwnable` have the same owner as `PrismaCore`.
            The ownership cannot be independently modified or renounced.
 */
contract PrismaOwnable {
    IPrismaCore public immutable PRISMA_CORE;

    constructor(address _prismaCore) {
        PRISMA_CORE = IPrismaCore(_prismaCore);
    }

    modifier onlyOwner() {
        require(msg.sender == PRISMA_CORE.owner(), "Only owner");
        _;
    }

    function owner() public view returns (address) {
        return PRISMA_CORE.owner();
    }

    function guardian() public view returns (address) {
        return PRISMA_CORE.guardian();
    }
}