// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntentToken {

    string public name = "IntentToken";
    string public symbol = "INTENT";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    constructor(uint supply) {
        totalSupply = supply * 10**decimals;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf[msg.sender] >= value, "not enough balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        return true;
    }

    function approve(address spender, uint value) public returns(bool) {
        allowance[msg.sender][spender] = value;
        return true;
    }

    function transferFrom(address from, address to, uint value) public returns(bool) {

        require(balanceOf[from] >= value, "not enough balance");
        require(allowance[from][msg.sender] >= value, "not approved");

        allowance[from][msg.sender] -= value;
        balanceOf[from] -= value;
        balanceOf[to] += value;

        return true;
    }
}
