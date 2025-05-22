// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example02 {
    uint256[] arr;
    uint256[3] arr1;

    function push(uint256 num) public {
        arr.push(num);
    }

    function pop() public {
        if (arr.length > 0) {
            arr.pop();
        }
    }

    function set(uint256 index, uint256 value) public {
        if (index < arr.length) {
            arr[index] = value;
        }
    }

    function get(uint256 index) public view returns (uint256) {
        if (index < arr.length) {
            return arr[index];
        } else {
            return 0;
        }
    }

    function len() public view returns (uint256) {
        return arr.length;
    }

    function sum() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < arr.length; ++i) {
            total += arr[i];
        }
        return total;
    }

    function push_arr1()public returns(uint256[3] memory){
        for (uint256 i = 0; i < 3; ++i) {
            arr1[i] = i;
        }
        return arr1;
    }
}
