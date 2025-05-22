// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Example03 {
    uint256[] state;

    function findMax(uint256[] calldata arr) public pure returns (uint256) {
        uint256 max = 0;
        for (uint256 i = 0; i < arr.length; ++i) {
            if (arr[i] > max) {
                max = arr[i];
            }
        }
        return max;
    }

    function selectionSort(
        uint256[] memory input
    ) public pure returns (uint256[] memory) {
        for (uint256 i = 0; i < input.length - 1; ++i) {
            uint256 min = i;
            for (uint256 j = i + 1; j < input.length; ++j) {
                if (input[j] < input[min]) {
                    min = j;
                }
            }
            if (i != min) {
                uint256 temp = input[i];
                input[i] = input[min];
                input[min] = temp;
            }
        }
        return input;
    }

    function printNowArray() public view returns (uint256[] memory) {
        return state;
    }



    function push(uint256[] calldata arr) public {
        uint256[] storage array = state;
        for (uint256 i = 0; i < arr.length; ++i) {
            array.push(arr[i]);
        }
    }

    function len() public view returns (uint256) {
        return state.length;
    }

    function calldataArray(
        uint256[] calldata arr
    ) public pure returns (uint256) {
        uint256[] calldata array = arr;
        return findMax(array);
    }
}
