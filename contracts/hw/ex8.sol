// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example04 {
    struct Wallet {
        address account;
        uint256 passwordHash;
        uint256 amount;
    }

    Wallet[] record;

    function deposit(uint256 password) public payable {
        (uint256 index, bool found) = getAccountIndex(msg.sender);
        uint256 passwordHash = hash(password);
        if (found) {
            if(password == record[index].passwordHash){
                record[index].amount += msg.value;
            }
        } else {
            record.push(Wallet(msg.sender, passwordHash, msg.value));
        }
    }

    function withdrawal(uint256 password) public {
        (uint256 index, bool found) = getAccountIndex(msg.sender);
        uint256 passwordHash = hash(password);

        if (found && passwordHash == record[index].passwordHash && record[index].amount != 0) {
            payable(msg.sender).transfer(record[index].amount);
            record[index].amount = 0;
        }
    }

    function transfer(uint256 passwordFrom, address to, uint256 passwordTo, uint256 amount) public {
        (uint256 index, bool found) = getAccountIndex(msg.sender);
        uint256 passwordFromHash = hash(passwordFrom);
        if (found && passwordFromHash == record[index].passwordHash && record[index].amount >= amount) {
            record[index].amount -= amount;
            (index, found) = getAccountIndex(to);
            if (found) {
                record[index].amount += amount;
            } else {
                uint256 passwordToHash = hash(passwordTo);
                record.push(Wallet(to, sha256(), amount));
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
    
    function hash(uint256 input) private pure returns (uint256) {
        return uint256(sha256(abi.encode(input)));
    }
}
