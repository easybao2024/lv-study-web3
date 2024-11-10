//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;
contract AddressDemo{
    // 地址表示账号: 普通地址,不可接收转账
    address addr1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // payable 修饰的地址,可以用来转账,有成员函数 transfer() 和 send()
    address payable payableAddr = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    /***
    
        当被转换的地址是一个是合约地址时，需要合约实现接收（receive）函数或具有 payable 修饰的回退（fallback）函数
        （这是两个特殊定义的函数，在后面小节会详细介绍），才能显式和 address payable 类型相互转换 
        （转换仍然使用 address(addr) 执行），如果合约没有接收或 payable 回退函数，则需要进行两次转换，
        将 payable(address(addr))转换为 address payable 类型 。

        地址类型支持的比较运算包括： <=、<、==、!=、>= 以及 >。常用的还是判断两个地址是相等（==）还是不相等（!=）。

        <address>.balance(uint256): 返回地址类型的余额,单位Wei
        <address payable>.transfer(uint256 amount) 向address转账比特币,单位Wei, 失败就抛异常
        <address payable>.send(uint256 amount) returns (bool):  向address转账金额,失败返回false
    
    ***/
    //相互转换
    address payable payAddr = payable(addr1);
    address addr2 = payableAddr;

    constructor(){
        // 
        payableAddr.transfer(100);
        bool isSucess = payableAddr.send(10);
    }

    function testTranser(address payable x) public {
        address myAddress = address(this); // this指当前合约, 合约类型可以转换为地址类型
        // 如果当前合约余额>=10 且 x地址的余额< 10 就向x转账10Wei
        if(myAddress.balance >= 10 && x.balance < 10){
            x.transfer(10);
        }
    }

    function tesTranser(address payable addr) public {
        address myAddr = address(this);
        if(myAddr.balance >= 10 && addr.balance < 10){
            addr.transfer(10);

            // x.call{value:1 ether}("");
            // 表示调用函数register函数 同时存入1 eth
            address(this).call{value:1 ether}(abi.encodeWithSignature("register(string)", "myName"));
            // 表示 调用函数register 只有在gas 有10000时才可以使用
            address(this).call{gas:10000}(abi.encodeWithSignature("register(string)","myName"));
            // 表示 调用函数register 只有在 gas有100000时才可以使用, 并同时存入1 ether
            address(this).call{gas:100000, value:1 ether}(abi.encodeWithSignature("register(string)","myName"));
        }
    }

}