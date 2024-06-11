# Bookmarks Manager

## 概要

- raindrop.ioを模したブックマーク管理アプリを開発する

## 機能

- ブックマークの保存
- 階層構造で管理
- ブックマークの編集、移動、削除
- 非表示
- パスワード
- ログイン
- ゲスト
- サブスクリプション
- スマホ対応
- PWA

## 目的

- ペアプロやモブプロなど共同開発を通して、C#を基準に将来性のある技術をキャッチアップする
- GitHubを使った共同開発を体験する
- コーチング、ティーチング、レビュー経験を通して説明力を上げる

## 技術選定

- ASP.NET Core MVCを検討
  - 案件が多いか
  - 将来性があるか
- ランキング
  - Webフレームワークランキング
  - スタックオーバーフロー
- フリーランスエージェント
  - フリーランススタート

## 開発フロー

1. 共同開発のための環境構築
2. 開発の進め方の方針決め
3. 使用技術と使用目的の解説
4. 公式ドキュメントのチュートリアルを通してフレームワーク、ライブラリの使い方を知る
5. 開発対象に置き換える
6. ローカル環境で動作確認
7. デプロイ

## 技術スタック

| 項目           | 詳細                           |
| -------------- | ------------------------------ |
| エディタ       | VSCode                         |
| バージョン管理 | GitHub</br>Git                 |
| DB             | Postgresql                     |
| DBクライアント | DBeaver                        |
| 言語           | C#                             |
| フレームワーク | ASP.NET Core MVC               |
| 単体テスト     | xUnit                          |
| E2Eテスト      | Playwright                     |
| ライブラリ     | Entity Framework Core</br>NLog |
| CI/CD          | GitHubActions                  |
| PaaS           | fly.io                         |
| その他         | Docker                         |

## 懸念点

- MacとWindowsの共同開発
  - Dockerで解決？
  - VSCodeの拡張機能「Dev Containers」で、ローカル環境を汚さずに開発環境を準備できそう
  - VSCodeの拡張機能「Live Share」で、リアルタイムの共同開発ができそう
