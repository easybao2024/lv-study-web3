// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract MapDemo{
    //方法比较少 没有key集合,value集合,length,没有contains方法
    mapping(string => uint) public map;
    mapping(string => uint[]) public scoresMap;// 记录每个用户的交易历史, 

   
    function get(string memory key) public view returns(uint){
        return map[key];
    }
    //添加或者更新值
    function updateValue(string memory key,uint value) public  {
        //因为map中不存在的key 对应的值是默认值, 删除某一个key之后,key不会被移出,只是值变为默认值   

        map[key] = map[key] + value;
        scoresMap[key].push(value);
        
    }
    //删除某一个key, key不会移出,对应的value变为默认值
    function delKey(string memory key) public {
        delete map[key];
        delete scoresMap[key];
    }
    function getUserRecord(string memory key) public view returns(uint[] memory){
        return scoresMap[key];
    }
    

    
}