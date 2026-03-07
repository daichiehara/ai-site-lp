#!/bin/bash
set -euo pipefail

S3_BUCKET="roadmint-co-jp-lp"
CF_DISTRIBUTION_ID="E3SS7E3WBLHLRO"
AWS_PROFILE="personal"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== S3にアップロード中... ==="
aws s3 sync "$SCRIPT_DIR/" "s3://$S3_BUCKET/" \
  --exclude ".git/*" \
  --exclude ".claude/*" \
  --exclude "deploy.sh" \
  --delete \
  --profile "$AWS_PROFILE"

echo ""
echo "=== CloudFrontキャッシュを無効化中... ==="
aws cloudfront create-invalidation \
  --distribution-id "$CF_DISTRIBUTION_ID" \
  --paths "/*" \
  --profile "$AWS_PROFILE" \
  --output text

echo ""
echo "=== デプロイ完了 ==="
