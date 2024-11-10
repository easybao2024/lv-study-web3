//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;
contract SelectorDemo{
    bytes4 public storedSelector;


    function store(bytes4 selector) public {
        storedSelector = selector;
    }
    function square(uint x) public pure returns(uint){
        return x * x;
    }
    function double(uint y) public pure returns(uint){
        return 2 * y;
    }
    function getSquareSelector() public pure returns(bytes4){
        return this.square.selector; 
    }
    function getDoubleSelector() public pure returns(bytes4){
        return this.double.selector;
    } 


    // 函数选择器做入参
    function executeFunction(bytes4 selector, uint x) public returns(uint) {
        // 通过abi 将选择器和入参 编码, 后进行call调用, 并返回结果data, success
        (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success,"executeFunction result failed");
        return abi.decode(data, (uint));
    }

    function executeStoredFunction(uint x) public returns(uint){
        require(storedSelector != bytes4(0),"storedSelector not set");
        (bool success ,bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector,x));
        require(success,"executeStoredFunction result failed");
        return abi.decode(data,(uint));
    }
}