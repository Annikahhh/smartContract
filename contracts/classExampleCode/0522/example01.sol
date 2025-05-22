// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example01 {
    struct Wallet {
        address account;
        uint256 amount;
    }

    Wallet wallet;

    function setAmount(uint256 amount) public {
        wallet = Wallet(msg.sender, amount);
    }

    function setWallet(Wallet calldata w) public {
        wallet = w;
    }

    function setWallet_with_more_intuitive(address account, uint256 amount) public {
        wallet = Wallet(account, amount);
    }

    function motifyWallet(Wallet memory w)public{
        w.amount *= 10;
        wallet = w;
    }

    function get() public view returns (Wallet memory) {
        return wallet;
    }
}
