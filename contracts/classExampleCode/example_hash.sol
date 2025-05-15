// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example03 {

    function hash(uint256 input) public pure returns (uint256) {
        return uint256(sha256(abi.encode(input)));
    }
}