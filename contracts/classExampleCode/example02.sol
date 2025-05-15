// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example02 {
    uint256 balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function getBlance() public  view returns (uint256) {
        return balance;
    }
}
