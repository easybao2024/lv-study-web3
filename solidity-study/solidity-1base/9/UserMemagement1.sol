// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;
contract UserMemagement{
    //设计一个用户管理合约，使用结构体记录用户的个人信息、余额及交易历史，探索如何优化结构体的设计以减少存储成本。
    struct User{
        address userAddress;//用户以太坊地址 
        string name;
        uint256 age;
        uint256 balance;
        TransactionHistory[] historys;
    }

    struct TransactionHistory{
        uint256 transactionId; // 交易id
        address conterpatry; //合约对手地址
        uint256 amount;
        uint256 trans_time;
    
    }
    mapping(address => User) public users;
    uint256 public trans_id = 0;
}