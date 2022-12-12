// SPDX-License-Identifier: UNLICENSED

// DO NOT MODIFY BELOW THIS
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Splitwise {
// DO NOT MODIFY ABOVE THIS


// ADD YOUR CONTRACT CODE BELOW

    mapping(address => mapping (address => uint32)) public debtMap;

    function lookup(address debtor, address creditor) public view returns (uint32 ret){
        return debtMap[debtor][creditor];
    }

    function add_IOU(address creditor, uint32 amount)  public {
        if (creditor != msg.sender){
            if(debtMap[creditor][msg.sender] > 0){
                uint32 temp = debtMap[creditor][msg.sender];
                if(amount<temp){
                    debtMap[creditor][msg.sender] -= amount;
                }
                else{
                    debtMap[msg.sender][creditor] += amount-temp;
                    debtMap[creditor][msg.sender] -= temp;
                }
            }
            else{
                debtMap[msg.sender][creditor] += amount;
            }
            }  
    }

}
