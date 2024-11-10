// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;

contract Value {
    uint256 public tokenBalance = 0;
    uint8 uintval = 255;

    function addValue() public payable {
        tokenBalance = tokenBalance + (msg.value / 10);
    }

    function getTokenBalance() public view returns (uint256) {
        return tokenBalance;
    }

    /**
        值类型: 在赋值和传参时是值传递



        先来介绍值类型，值类型在赋值或传参时，总是进行值拷贝，用值类型声明的变量，总是可以保存在 32 个字节的空间里。
        值类型包含有：
        布尔类型（Booleans）
        整型（Integers）
        定长浮点型（Fixed Point Numbers）
        定长字节数组（Fixed-size byte arrays）
        有理数和整型常量（Rational and Integer Literals)
        字符串常量（String literals）
        十六进制常量（Hexadecimal literals）
        枚举（Enums）
        函数类型（Function Types）
        地址类型（Address)
        地址常量（Address Literals）
   */
}
