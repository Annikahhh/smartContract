// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example03 {
    struct vault {
        uint256 balance;
        uint256 passwordHash;
        bool exists;
    }

    mapping(address => vault) public vaults;

    function deposit(uint256 password) public payable {
        uint256 hashed = uint256(sha256(abi.encode(password)));
        if(!vault[msg.sender].exists){
            vault[msg.sender] = vault({
                balance: msg.value,
                passwordHash: hashed,
                exists: true
            });
        }
        else{
            if((vault[msg.sender].passwordHash == hashed)){
                vault[msg.sender].balance += msg.value;
            }
        }
    }

    function withdraw(uint256 password , uint256 amount) public {
        uint256 hashed = uint256(sha256(abi.encode(password)));
        if(vault[msg.sender].passwordHash == hashed)
        {
            if(vault[msg.sender].balance >= amount){
                vault[msg.sender].balance -= amount;
                payable(msg.sender).transfer(amount);
            }
        }
    }

    function getBlance(uint256 password) public  view returns (uint256) {
        uint256 hashed = uint256(sha256(abi.encode(password)));
        if(vault[msg.sender].passwordHash == hashed)
        {
            return vault[msg.sender].balance;   
        }
        return -1;
    }

    function hash(uint256 input) public pure returns (uint256) {
        return uint256(sha256(abi.encode(input)));
    }
}
