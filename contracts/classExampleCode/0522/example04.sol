// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example04 {
    struct Wallet {
        address account;
        uint256 amount;
    }

    Wallet[] record;

    function deposit() public payable {
        (uint256 index, bool found) = getAccountIndex(msg.sender);
        if (found) {
            record[index].amount += msg.value;
        } else {
            record.push(Wallet(msg.sender, msg.value));
        }
    }

    function withdrawal() public {
        (uint256 index, bool found) = getAccountIndex(msg.sender);
        if (found && record[index].amount != 0) {
            payable(msg.sender).transfer(record[index].amount);
            record[index].amount = 0;
        }
    }

    function transfer(address to, uint256 amount) public {
        (uint256 index, bool found) = getAccountIndex(msg.sender);
        if (found && record[index].amount >= amount) {
            record[index].amount -= amount;
            (index, found) = getAccountIndex(to);
            if (found) {
                record[index].amount += amount;
            } else {
                record.push(Wallet(to, amount));
            }
        }
    }

    function getBalance(address addr) public view returns (uint256) {
        (uint256 index, bool found) = getAccountIndex(addr);
        if (found) {
            return record[index].amount;
        } else {
            return 0;
        }
    }

    function getAccountIndex(
        address addr
    ) private view returns (uint256, bool) {
        for (uint256 i = 0; i < record.length; ++i) {
            if (record[i].account == addr) {
                return (i, true);
            }
        }
        return (0, false);
    }
}
