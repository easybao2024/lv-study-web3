//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;
contract UintDemo{
    //整形溢出案例: 整型溢出时就会从0开始, 溢出就像时钟一样，当秒针走到 59 之后，下一秒又从 0 开始
    function add1() public pure returns(uint8){
        uint8 x = 128;
        uint8 y = 2;
        return x*y; //结果为0, 因为uint8范围: 0-255 ,溢出就从0开始
    }

    function add2() public pure returns(uint8){
        uint8 x = 140;
        uint8 y = 116;
        return x+y; //结果: 0
    }
    function add3() public pure returns(uint8){
        uint8 x = 1;
        uint8 y = 2;
        uint z = x-y;
        require(z >= 0,"rollback");
        return x-y; //结果为255
    }

    // 这个结果在0.5.0 编译器中是正确的 能拿到预期结果,
    // 但是 在0.8.26 编译期正确, 执行会直接报错,进而recevt 优化了整型溢出问题

    //怎么预防整形溢出: 使用require校验,通过后再执行
}