// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MockRealitio} from "../src/MockRealitio.sol";

contract MockRealitioScript is Script {
    MockRealitio public mockRealitio;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        mockRealitio = new MockRealitio();

        vm.stopBroadcast();
    }
}
