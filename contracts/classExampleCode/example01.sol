// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example01 {
    uint256 number;

    function setNumber(uint256 num) public returns (uint256) {
        number = num;
        return number;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}