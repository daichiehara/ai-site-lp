# AI導入支援LP - 開発ガイド

## プロジェクト概要
ロードミント株式会社の中小企業向けAI導入支援LPサイト。
静的HTML/CSSで構成（ビルド不要）。

- 公開URL: https://ai.roadmint.co.jp/
- コーポレートサイト: https://roadmint.co.jp/

## 構成
```
index.html      - メインLP
privacy.html    - プライバシーポリシー
css/style.css   - スタイルシート
images/         - 画像アセット
deploy.sh       - デプロイスクリプト
```

## デプロイ
S3 + CloudFront構成。AWSプロファイル `personal` を使用。

```bash
./deploy.sh
```

- S3バケット: `roadmint-co-jp-lp`
- CloudFrontディストリビューション: `E3SS7E3WBLHLRO`
- キャッシュ無効化は自動で実行される
- 反映まで数分かかる場合がある
