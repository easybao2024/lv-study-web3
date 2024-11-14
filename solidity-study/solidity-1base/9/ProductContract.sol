// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;

contract ProductContract {
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 stock;
    }

    struct Order {
        uint256 orderId;
        uint256 productId;
        address consumerAddress; // 记录是谁通过合约发起了这笔订单,也就是合约的调用者, 订单归属者
        uint256 productNum;
        uint256 totalPrice;
        uint256 createTime;
    }

    mapping(uint256 => Product) productMap;
    uint256 public mapKey = 0;

    uint256 public orderId = 0;
    mapping(uint256 => Order) orderMap;

    function addProduct(
        string memory _name,
        uint256 _price,
        uint256 _stock
    ) public {
        mapKey++;
        productMap[mapKey] = Product(mapKey, _name, _price, _stock);
    }

    function updatePrice(uint256 _mapKey, uint256 _newPrice) public {
        Product storage product = productMap[_mapKey];
        product.price = _newPrice;
    }

    function updateStock(uint256 _mapKey, uint256 _newStore) public {
        Product storage product = productMap[_mapKey];
        product.stock = _newStore;
    }

    function getProduct(uint256 _mapKey)
        public
        view
        returns (
            string memory,
            uint256,
            uint256
        )
    {
        Product storage product = productMap[_mapKey];
        return (product.name, product.price, product.stock);
    }

    function createOrder(uint256 productId, uint256 quantity) public {
        require(productId > 0 && productId <= mapKey, "error productId input");
        Product storage product = productMap[productId];
        require(
            quantity > 0 && quantity <= product.stock,
            "quantity is greater then product stock"
        );
        orderId++;
        uint256 totalPrice = quantity * product.price;
        Order memory order = Order(
            orderId,
            productId,
            msg.sender,
            quantity,
            totalPrice,
            block.timestamp
        );
        orderMap[orderId] = order;
        product.stock = product.stock - quantity;
    }

    function getOrder(uint256 _orderId) public view returns (Order memory) {
        require(_orderId > 0 && _orderId <= orderId, "error _orderId input");
        return orderMap[_orderId]; //tuple(uint256,uint256,address,uint256,uint256,uint256): 1,1,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,2,30,1731557769
    }

    function getOrderDetail(uint256 _orderId)
        public
        view
        returns (
            uint256,
            uint256,
            address,
            uint256,
            uint256,
            uint256
        )
    {
        require(_orderId > 0 && _orderId <= orderId, "error _orderId input");
        Order storage order = orderMap[_orderId];
        return (
            order.orderId,
            order.productId,
            order.consumerAddress,
            order.productNum,
            order.totalPrice,
            order.createTime
        );
    }
}
