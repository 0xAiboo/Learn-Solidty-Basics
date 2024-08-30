// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleContract {
    uint public storedValue;

    function setValue(uint value) public {
        storedValue = value;
    }

    function getValue() public view returns (uint) {
        return storedValue;
    }
}
