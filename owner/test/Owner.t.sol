// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Owner.sol";

contract ContractTest is Test {
    Owner ownerContract;
    address newOwner = address(0xBEEF);
    address firstOwner = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;

    function setUp() public {
        ownerContract = new Owner();
    }

    function testFirstOwner() public {
        assertEq(ownerContract.getOwner(), firstOwner);
    }

    function testChangeOwner() public {
        ownerContract.changeOwner(newOwner);
        assertEq(ownerContract.getOwner(), newOwner);
    }

    function testChangeOwnerUnauthorized() public {
        vm.prank(newOwner);
        vm.expectRevert("Caller is not owner");
        ownerContract.changeOwner(newOwner);
    }

}