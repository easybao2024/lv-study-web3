// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract ReferenceDemo{
    // 引用类型
    uint[] x;// storage
    function f(uint[] memory y) public {
        x = y; // 会独立拷贝y到 storage中
        uint[] storage z = x; //分配一个指针给z, 指向x,  x和z 同时指向一个storage存储区域

        z[0] = 100; // z发生变化,x也会发生变化
        //  delete x; // 删除x z也会发生变化
       
    }
    function printx() public view returns(uint){
        return x[0];
    }


    uint[] data;

    function updateData(uint[] memory newData) public {
        data = newData;
    }
    function getData() public view returns(uint[] memory){
        return data;
    }
    function modifyStorageData(uint index,uint x) public {
        require(index < data.length," index out of  data array length");
        data[index] = x;
    }

    function modifyMemoryData(uint[] memory newArr) public pure returns(uint[] memory){
        require(newArr.length > 0, "error newArr");
        newArr[0] = 1234;
        return newArr;
    }
   
}