// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract LeaderBoard{
    // 用 array 和 mapping 实现一个积分排行榜

    mapping(address => uint) public scoresMap; //存储用户--积分
    address[] public addressArr;//用户数组

    //获取用户积分
    function getScoreByAddress(address user) public view returns(uint){
        require(scoresMap[user] >=0 ,"user is not exists");
        return scoresMap[user];
    }

    //清除积分
    function delScoreByAddress(address user) public  {
         require(scoresMap[user] >=0 ,"user is not exists");
        delete scoresMap[user];
        del_and_sort_for_array(user);
    }

    //添加/更新积分
    function addOrUpdate(address user, uint score) public {
        if(scoresMap[user] > 0){
            // 已存在
            del_and_sort_for_array(user);
        }
        scoresMap[user] = score;
        add_and_sort_for_array(user);
    }


    function add_and_sort_for_array(address user) private  {
        addressArr.push(user);
        sort_for_array();
    }
    
    function del_and_sort_for_array(address user) private {
        for(uint i =0; i < addressArr.length ; i++){
            if(addressArr[i] == user){
                addressArr[i] = addressArr[addressArr.length - 1];
                addressArr.pop();
            }
        }
        sort_for_array();
    }
    
    function  sort_for_array() private {
        require(addressArr.length >0 ,"empty addressArr");
        for(uint x=0; x<addressArr.length-1;x++){
            for(uint y=x+1; y < addressArr.length; y++){
                if(scoresMap[addressArr[x]] > scoresMap[addressArr[y]]){
                    address temp = addressArr[x];
                    addressArr[x] = addressArr[y];
                    addressArr[y] = temp;
                }
            }
        }
    }

    // 获取排名前n名的用户
    function get_first_sort_n_user(uint n) public view returns(address[] memory){
        require(n>=0 && n <= addressArr.length, "n is greater then addressArr length");
        address[] memory resArr = new address[](n) ;
        for(uint x=0; x< n; x++){
            resArr[x] = addressArr[x];
        }
        return resArr;
    }

}