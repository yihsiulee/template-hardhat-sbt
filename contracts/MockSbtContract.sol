// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract MockSbtNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;
    error TransferNotAllowed();

    constructor(
        address _initialOwner
    ) ERC721("MockSbt", "MSBT") Ownable(_initialOwner) {}

    function mint(address to) public onlyOwner {
        _tokenIdCounter = _tokenIdCounter + 1;
        _mint(to, _tokenIdCounter);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override(ERC721, IERC721) {
        if (from != address(0)) {
            revert TransferNotAllowed();
        }
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public override(ERC721, IERC721) {
        if (from != address(0)) {
            revert TransferNotAllowed();
        }

        _safeTransfer(from, to, tokenId, data);
    }
}
