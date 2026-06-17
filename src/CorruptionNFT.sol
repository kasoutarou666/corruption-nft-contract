// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CorruptionNFT is ERC721, ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 8888;
    uint256 public constant MINT_PRICE = 0;
    
    // 告発記録
    struct AccusationRecord {
        uint8 politicianId;  // 0-7 どの議員か
        uint32 clearTime;    // クリアタイム（秒）
        uint32 timestamp;    // ミント日時
    }
    
    mapping(uint256 => AccusationRecord) public records;
    
    event Accused(address indexed accuser, uint256 tokenId, uint8 politicianId, uint32 clearTime);

    constructor() ERC721("Corruption NFT", "CORRUPT") Ownable(msg.sender) {}

    function mint(uint8 politicianId, uint32 clearTime, string memory tokenURI) external {
        require(_tokenIdCounter < MAX_SUPPLY, "Max supply reached");
        require(politicianId < 8, "Invalid politician ID");
        
        uint256 tokenId = _tokenIdCounter++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        records[tokenId] = AccusationRecord({
            politicianId: politicianId,
            clearTime: clearTime,
            timestamp: uint32(block.timestamp)
        });
        
        emit Accused(msg.sender, tokenId, politicianId, clearTime);
    }

    function getRecord(uint256 tokenId) external view returns (AccusationRecord memory) {
        return records[tokenId];
    }

    function totalSupply() external view returns (uint256) {
        return _tokenIdCounter;
    }

    // Override required functions
    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
