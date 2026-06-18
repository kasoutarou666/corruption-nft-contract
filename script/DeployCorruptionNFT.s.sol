// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {CorruptionNFT} from "../src/CorruptionNFT.sol";

contract DeployCorruptionNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        
        new CorruptionNFT();
        
        vm.stopBroadcast();
    }
}
