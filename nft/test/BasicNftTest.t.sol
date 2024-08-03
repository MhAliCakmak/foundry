//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {Dogies} from "../src/BasicNft.sol";

import {console} from "forge-std/console.sol";

contract BasicNftTest is Test {
    Dogies public dogies;
    address public USER= makeAddr("user");

    function setUp() public {
        DeployBasicNft deploy = new DeployBasicNft();
        dogies = deploy.deploy();
    }

    function testNameIsCorrect()public view{
        string memory name = dogies.name();
        string memory expectedName= "Dogies";
        assertEq(keccak256(abi.encodePacked(name)),keccak256(abi.encodePacked(expectedName)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        dogies.safeMint(USER);
        assertEq(dogies.balanceOf(USER),1);
    }
}