# ASP.NET Core MVC

## 事前準備

- csprojがあるディレクトリに移動する

```bash
cd src/BookmarksManager
```
## ビルド

```bash
dotnet clean
dotnet build
```

## 実行

```bash
dotnet run
```

## コードフォーマット

- .editorconfigとStyleCop.Analyzersを使用しフォーマットする

```bash
dotnet format --severity info
```

## 静的解析

- Roslynatorで静的解析する

```bash
# TODO: 事前にビルドする
# 診断
dotnet roslynator analyze
# 修正
dotnet roslynator fix
```

## パフォーマンス計測

- dotnet-countersでプロセスを監視する

```bash
# TODO: アプリをデバッグや実行する
# ポート番号からプロセスを確認
lsof -i :[ポート番号]
# プロセスを監視
dotnet dotnet-counters monitor -p [PID]
```

