// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IHw01 {
    function checkIn() external;
    function getTask01(address account) external view returns (bool);
    function getTask02(address account) external view returns (bool);
}

contract Task02 {
    IHw01 hw01;
    address owner;

    constructor() {
        hw01 = IHw01(0x2DB08234e1cEE53815CB5B6100a2A8A2776C8eC8);
        owner = msg.sender;
    }

    function task02() public {
        hw01.checkIn();
    }

    function getTask01() public view returns (bool) {
        return hw01.getTask01(owner);
    }

    function getTask02() public view returns (bool) {
        return hw01.getTask02(owner);
    }

    function Owner() external view returns (address) {
        return owner;
    }
}
