// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleInsurance {
    address payable public insurer;
    mapping(address => uint) public balances;

    event Insured(address indexed user, uint amount);
    event PaidOut(address indexed user, uint amount);

    constructor() {
        insurer = payable(msg.sender);
    }

    function insure() external payable {
        require(msg.value > 0, "Must send some ether to insure");
        balances[msg.sender] += msg.value;
        emit Insured(msg.sender, msg.value);
    }

    function payout(address payable user, uint amount) external {
        require(msg.sender == insurer, "Only insurer can payout");
        require(balances[user] >= amount, "Not enough balance");
        balances[user] -= amount;
        user.transfer(amount);
        emit PaidOut(user, amount);
    }
}
