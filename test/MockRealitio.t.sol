// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "forge-std/console2.sol";
import {MockRealitio} from "../src/MockRealitio.sol";

contract MockRealitioTest is Test {
    MockRealitio public mockRealitio;

    function setUp() public {
        mockRealitio = new MockRealitio();
    }

    function test_AddOwner() public {
        address newOwner = address(0x123);
        mockRealitio.addOwner(newOwner);
        assertTrue(mockRealitio.owners(newOwner));
    }

    function test_RemoveOwner() public {
        address ownerToRemove = address(0x456);
        mockRealitio.addOwner(ownerToRemove);
        mockRealitio.removeOwner(ownerToRemove);
        assertFalse(mockRealitio.owners(ownerToRemove));
    }

    function testFuzz_SetContentHash(bytes32 questionId, bytes32 contentHash) public {
        mockRealitio.setContentHash(questionId, contentHash);
        assertEq(mockRealitio.getContentHash(questionId), contentHash);
    }

    function testFuzz_SetOpeningTS(bytes32 questionId, uint32 openingTS) public {
        mockRealitio.setOpeningTS(questionId, openingTS);
        assertEq(mockRealitio.getOpeningTS(questionId), openingTS);
    }

    function testFuzz_SetResult(bytes32 questionId, bytes32 result) public {
        mockRealitio.setResult(questionId, result);
        assertEq(mockRealitio.resultFor(questionId), result);
    }
}
