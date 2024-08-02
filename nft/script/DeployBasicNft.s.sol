//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Dogies} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {
    function deploy() public returns (Dogies) {
        vm.startBroadcast();
        Dogies dogies = new Dogies(msg.sender);
        vm.stopBroadcast();
        return dogies;
    }
}
