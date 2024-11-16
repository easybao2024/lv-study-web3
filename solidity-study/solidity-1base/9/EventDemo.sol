// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.26;
contract EventDemo{
    uint256 public data;
    event dataChange(uint256 newValue);

    function setData(uint256 _data) public {
        data = _data;
        emit dataChange(_data);
    }
}


pragma solidity >=0.6.0;
contract ExternalContract {
    function getValue() public pure returns (uint) {
        return 42;
    }
    function willRevert() public pure {
        revert("This function always fails");
    }
}
contract TryCatchExample {
    ExternalContract externalContract;
    constructor() {
        externalContract = new ExternalContract();
    }
    function tryCatchTest() public returns (uint, string memory) {
        try externalContract.getValue() returns (uint value) {
            return (value, "Success");
        } catch {
            return (0, "Failed");
        }
    }
    function tryCatchWithRevert() public returns (string memory) {
        try externalContract.willRevert() {
            return "This will not execute";
        } catch Error(string memory reason) {
            return reason;  // 捕获错误信息
        } catch {
            return "Unknown error";
        }
    }
}