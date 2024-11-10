// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract ArrayDemo{
    //静态数组
    uint[4] arr1;
    uint[4] arr2 = [1,2,3,4]; //定长

    //动态数组
    uint[] arr3;
    uint[] arr4 = [12,23,34,45]; //可以添加元素,长度可变

    uint[] public storageArr; 


    //直接写在函数外部是不对的, 要写在函数里面
    // arr4[1] = 223;
    // uint x = arr4[1];
    function methodx(uint[] calldata calldataArr) public returns(uint ){
        arr4[1] = 223;
        uint x = arr4[1];  

        arr4.push(123);
        arr4.push(45);

        arr4.pop();
        // 切片, 只能对calldata 的数组进行切片  
        uint[] memory slice = calldataArr[1:3];
        uint length = arr4.length;
        return slice.length + length + x;
    }

    // 特殊的数组 bytes string 不支持用下标访问
    bytes bytesArr = "lvbao lvcai";
    bytes bytesArr1 = new bytes(10);
    string str = "wewerwer";


    uint[] public array1 ;
    // uint flag = 0;
    function add(uint x) public {
        // array1[flag] = x;
        // flag++;
        array1.push(x);
    }
    function sum() public view returns(uint){
        uint sum = 0;
        for(uint x = 0; x < array1.length; x++){
            sum += array1[x];
        }
        return sum;
    }
    function deleteByValue(uint x) public returns(uint){
       
        for(uint y = 0 ;y < array1.length ; y++){
            if(array1[y] == x){
                array1[y] = array1[array1.length - 1];
                array1.pop();
            }
        }
    }
    function printArr() public view returns(uint[] memory){
        return array1;
    }
}