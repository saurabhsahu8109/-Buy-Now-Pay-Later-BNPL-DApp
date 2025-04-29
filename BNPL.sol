// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BNPLDApp {
    address public owner;
    mapping(address => uint256) public creditBalance;

    constructor() {
        owner = msg.sender;
    }

    function purchaseOnCredit(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        creditBalance[msg.sender] += amount;
    }

    function repayDebt() public payable {
        require(creditBalance[msg.sender] > 0, "No outstanding debt");
        require(msg.value <= creditBalance[msg.sender], "Repaying more than owed");
        creditBalance[msg.sender] -= msg.value;
    }
}
