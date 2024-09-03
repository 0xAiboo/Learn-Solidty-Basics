// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 public storedValue;

    function set(uint256 value) public {
        storedValue = value;
    }

    function get() public view returns (uint256) {
        return storedValue;
    }
}
