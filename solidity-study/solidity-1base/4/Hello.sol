// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract Hello{

    function getName() public  pure returns(string memory){
        // 获取当前合约名字
       return type(Hello).name;
    }

    // function getRuntimeCode() public pure returns(bytes memory){
    //     //返回当前合约的运行时字节码
      
    //     return type(Hello).runtimeCode;
    // }
    // function getCreationCode() public pure returns(bytes memory){
    //     return type(Hello).creationCode;
    // }

    function isContract(address addr) public view returns(bool){
        uint256 size;
        assembly {size:= extcodesize(addr)}
        return size>0;
    }

    function getFunctionSelector1() public pure returns(bytes4){
        // return bytes4(keccak256("getName")); //返回函数选择器
        return this.getName.selector;
    }
     function getFunctionSelector2() public pure returns(bytes4){
        return bytes4(keccak256("getName")); //返回函数选择器
        // return this.getName.selector;
        // 函数选择器可以作为入参
    }


    //函数选择器的动态调用
    function select(bytes4 selector, uint x) external returns(uint z){
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector,x));
        require(success,"Function call failed");
        z = abi.decode(data,(uint));
        return z;
    }

    bytes4 state;//状态变量
    function transferSelector(bytes4 selector) external {
        state = selector;
    }



}