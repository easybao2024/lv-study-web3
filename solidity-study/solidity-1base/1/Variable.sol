// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

contract Variable {
    //状态变量
    uint256 uintval;
    address owner;

    constructor() {
        // 声明状态变量,并在构造器中赋值
        uintval = 123;
        // msg 是全局变量,随时可以使用, 常用的是msg.sender用来获取消息发送者,  msg.value : 发送消息的Wei值
        owner = msg.sender;
    }

    function sum(uint256 x, uint256 y) public pure returns (uint256) {
        uint256 z = 123; //局部变量, 存在于函数中,
        return x + y + z;
    }

    /**
        常用快捷键: 
            编译: ctrl + S
            Shift + Alt + F : Format the code in the current file 格式化代码
            CTRL + Shift + F : Open the File Explorer
            CTRL + Shift + A : Open the Plugin Manager
            CTRL + SHIFT + S: Compile the current contract & Run an associated script

    */

    /*
        blockhash(uint blockNumber) returns (bytes32) 给定区块的哈希值 – 只适用于 256 最近区块, 不包含当前区块
        block.coinbase (address payable) 当前区块矿工的地址
        block.difficulty (uint) 当前区块的难度
        block.gaslimit (uint) 当前区块的 gaslimit
        block.number (uint) 当前区块的 number
        block.timestamp (uint) 当前区块的时间戳，为 unix 纪元以来的秒
        gasleft() returns (uint256) 剩余 gas

        msg.data (bytes calldata) 完成 calldata
        msg.sender (address payable) 消息发送者 (当前 caller)
        msg.sig (bytes4) calldata 的前四个字节 (function identifier)
        msg.value (uint) 当前消息的 wei 值

        now (uint) 当前块的时间戳
        tx.gasprice (uint) 交易的 gas 价格
        tx.origin (address payable) 交易的发送方
        
    
    */
}
