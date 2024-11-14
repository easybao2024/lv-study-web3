// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;

contract StructDemo{
   
    //合约类中可以拥有自身类型的成员变量
    mapping(string => StructDemo) public map;
    StructDemo[] public structArr;
    StructDemo demo;


    //结构体声明
    StructType1 st1;
   //  StructType1 st2 = StructType1("lvbao",[],123); //报错, 可能是数组不能空
   StructType1 st2 ;
   constructor(){
      // 可以在构造函数和 函数中 初始化结构体
      st2.str = "lvbao";
      st2.strArr = new string[](10);// 这里一定要记得把数组初始化, 并指定长度, 否则编译通过,部署失败, 找bug很难
      st2.strArr[0] = "12312";
      st2.strArr[1] = "ses";
      st2.ut = 123;
      
   }

    
    // 结构体定义
     struct StructType1{ //不能定义空结构体类型, 会编译报错
        string str;
        string[] strArr;
        uint ut;

        //结构体自身不能直接包含自身类型作为成员变量, 可以间接包含,比如包含在一个mapping中 一个数组中
            //但是赋值时,会造成循环赋值,编译报错
      //   mapping(string => StructType1) map1;
      //   StructType1[] arr1;
     }

  




   struct User{
      string name;
      uint age;
      // english => 98
      mapping(string => uint) score;
   }

   mapping(address => User) public users;
   function createUser(string memory _name,uint _age) public {
      // User memory user = users[msg.sender]; // 不能用memory 因为User结构体中有映射,
      // 在Solidity中，不能直接将包含映射类型成员的存储（storage）结构体赋值给内存（memory）类型的变量,
      // 因为memory类型变量在内存中的存储方式和storage类型不同，这种赋值可能会导致数据不一致或其他不可预测的问题
      User storage user = users[msg.sender];
      user.name = _name;
      user.age = _age;
   }

   function updateUsersScore(string memory course, uint _score) public {
      users[msg.sender].score[course] = _score;
   }

   function getUsersScore(string memory course) public view returns(uint){
      return users[msg.sender].score[course];
   }
}