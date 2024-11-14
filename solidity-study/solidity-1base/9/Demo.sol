// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract Demo{
    //作业
    struct Product{
        string name;
        uint id;
        uint price;
        uint stock;
    }
    mapping(address => Product) productMap;

    //加库存
    function addStock(uint num) public {
        Product storage product = productMap[msg.sender];
        product.stock += num;
    }

    //改价格
    function updatePrice(uint _price) public {
        Product storage product = productMap[msg.sender];
        product.price = _price;
    }
    // 产品信息
    function getDetail() public view returns(string memory , uint , uint  , uint ){
        Product storage product = productMap[msg.sender];
        return (product.name, product.id, product.price,product.stock);
    }
}