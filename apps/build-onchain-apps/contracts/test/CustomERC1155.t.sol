// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from 'forge-std/Test.sol';
import {COFFEEKITTEN} from '../src/CustomERC1155.sol';

contract CustomERC1155Test is Test {
  COFFEEKITTEN public customERC1155;

  function setUp() public {
    customERC1155 = new COFFEEKITTEN();
  }

  function testMint() public {
    customERC1155.mint(address(this), 0, 1, '');
    assertEq(customERC1155.balanceOf(address(this), 0), 1);
  }

  function testMintBatch() public {
    uint256[] memory ids = new uint256[](2);
    ids[0] = 0;
    ids[1] = 1;
    uint256[] memory amounts = new uint256[](2);
    amounts[0] = 1;
    amounts[1] = 2;
    customERC1155.mintBatch(address(this), ids, amounts, '');
    assertEq(customERC1155.balanceOf(address(this), 0), 1);
    assertEq(customERC1155.balanceOf(address(this), 1), 2);
  }

  function onERC1155Received(
    address operator,
    address from,
    uint256 id,
    uint256 value,
    bytes calldata data
  ) external returns (bytes4) {
    return this.onERC1155Received.selector;
  }

  function onERC1155BatchReceived(
    address operator,
    address from,
    uint256[] calldata ids,
    uint256[] calldata values,
    bytes calldata data
  ) external returns (bytes4) {
    return this.onERC1155BatchReceived.selector;
  }
}
