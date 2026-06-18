# 🏛️ Corruption NFT Contract

> 汚職議員を告発せよ！ゲームクリア記念NFTをBaseチェーンに刻め！

## 📋 概要

「汚職議員を告発せよ！」ゲームのクリア記念NFTスマートコントラクトです。
Farcaster Mini App内でゲームをクリアすると、告発した汚職議員のNFTをBaseチェーンにMintできます。

## 🔗 デプロイ情報

| 項目 | 内容 |
|------|------|
| ネットワーク | Base Mainnet |
| コントラクトアドレス | `0x5E6576E8EA4582ec975FefED72654C97bD57ba7E` |
| Basescan | [確認する](https://basescan.org/address/0x5E6576E8EA4582ec975FefED72654C97bD57ba7E) |
| 規格 | ERC-721 |
| 最大供給数 | 8,888 |
| Mint価格 | 無料 |

## 🎮 関連プロジェクト

- [汚職議員を告発せよ！](https://corruption-sweeper.vercel.app) - Farcaster Mini App
- [GitHub: corruption-sweeper](https://github.com/kasoutarou666/corruption-sweeper)

## 🤵 汚職議員キャラクター

| ID | 名前 | 容疑 |
|----|------|------|
| 0 | 嘘市 | 公約を一度も守らず |
| 1 | 口いっぱいおにぎり | 政務活動費で飲食三昧 |
| 2 | 増税メガネ | 消費税を何度も上げた |
| 3 | ボケ傀儡 | 官僚の言いなりボケ老人 |
| 4 | ゴルフやる三 | 国会中にゴルフ三昧 |
| 5 | 民営化詐欺師 | 日本の資産を外国へ売った |
| 6 | 消費税導入クソ野郎 | 日本にブレーキをかけたA級戦犯 |
| 7 | エステクソババア | 高額予算を全て無に帰す金食い女 |

## 🛠️ 技術スタック

- **Solidity** ^0.8.20
- **Foundry** - テスト・デプロイ
- **OpenZeppelin** v5.6.1 - ERC-721実装
- **Base** - L2ブロックチェーン

## 🚀 ローカル開発

```bash
git clone https://github.com/kasoutarou666/corruption-nft-contract.git
cd corruption-nft-contract
forge install
forge build
forge test
```

## 📝 コントラクト関数

### mint
```solidity
function mint(uint8 politicianId, uint32 clearTime, string memory tokenURI) external
```
ゲームクリア時に呼び出される。告発した議員IDとクリアタイムを記録。

### getRecord
```solidity
function getRecord(uint256 tokenId) external view returns (AccusationRecord memory)
```
トークンIDから告発記録を取得。

## 📜 ライセンス

MIT
