// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken ourToken;
    address owner = address(this);
    address spender = address(0xCAFE);
    address recipient = address(0xDEAD);

    function setUp() public {
        ourToken = new OurToken();
    }

    function testAllowance() public {
        uint256 amount = 100;
        ourToken.approve(spender, amount);
        assertEq(ourToken.allowance(owner, spender), amount);
    }

    function testTransfer() public {
        uint256 amount = 50;
        ourToken.transfer(recipient, amount);
        assertEq(ourToken.balanceOf(recipient), amount);
    }

    function testTransferFrom() public {
        uint256 amount = 50;
        ourToken.approve(spender, amount);
        vm.prank(spender);
        ourToken.transferFrom(owner, recipient, amount);
        assertEq(ourToken.balanceOf(recipient), amount);
    }

    
}