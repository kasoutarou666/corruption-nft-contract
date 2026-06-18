// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {CorruptionNFT} from "../src/CorruptionNFT.sol";

contract CorruptionNFTTest is Test {
    CorruptionNFT public nft;
    address public user = address(0x1234);

    function setUp() public {
        nft = new CorruptionNFT();
    }

    function test_Mint() public {
        vm.prank(user);
        nft.mint(0, 60, "ipfs://test");
        assertEq(nft.totalSupply(), 1);
        assertEq(nft.ownerOf(0), user);
    }

    function test_MintRecord() public {
        vm.prank(user);
        nft.mint(3, 120, "ipfs://test");
        CorruptionNFT.AccusationRecord memory record = nft.getRecord(0);
        assertEq(record.politicianId, 3);
        assertEq(record.clearTime, 120);
    }

    function test_InvalidPoliticianId() public {
        vm.prank(user);
        vm.expectRevert("Invalid politician ID");
        nft.mint(8, 60, "ipfs://test");
    }

    function test_MultipleMintsAllPoliticians() public {
        for (uint8 i = 0; i < 8; i++) {
            vm.prank(user);
            nft.mint(i, 100, "ipfs://test");
        }
        assertEq(nft.totalSupply(), 8);
    }
}
