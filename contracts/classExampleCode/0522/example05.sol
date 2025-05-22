// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example05 {
    mapping(address => uint256) record;

    function deposit(address to, uint256 amount) public {
        record[to] = amount;
    }

    function delete_someone(address to) public {
        delete (record[to]);
    }

    function getBalance(address addr) public view returns (uint256) {
        return record[addr];
    }
}
