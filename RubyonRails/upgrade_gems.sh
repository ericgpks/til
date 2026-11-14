#!/usr/bin/env bash
# RubyonRails/ 配下のサンプルアプリを Rails 8.0 系に上げて Gemfile.lock を作り直す
# 使い方: Ruby 3.2 以上を有効にした状態で  bash RubyonRails/upgrade_gems.sh
set -euo pipefail
cd "$(dirname "$0")"

RUBY_VER="$(ruby -e 'print RUBY_VERSION')"
if ! ruby -e 'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.2.0"))'; then
  echo "Ruby $RUBY_VER は古すぎます。Rails 8 には Ruby 3.2 以上が必要です。" >&2
  exit 1
fi
echo "Ruby $RUBY_VER を使います"
gem install bundler --conservative --no-document >/dev/null
gem update bundler --no-document >/dev/null

failed=()

# 直下の Gemfile（gem "rails" のみ）
echo "== RubyonRails/ (root)"
bundle update --all || failed+=("root")

for app in */; do
  app="${app%/}"
  [ -f "$app/Gemfile" ] || continue
  echo "== $app"
  (
    cd "$app"
    echo "$RUBY_VER" > .ruby-version
    rm -f Gemfile.lock
    bundle lock --add-platform arm64-darwin x86_64-linux >/dev/null 2>&1 || true
    bundle install
  ) || failed+=("$app")
done

echo
if [ ${#failed[@]} -eq 0 ]; then
  echo "すべて成功しました。git diff を確認してコミットしてください。"
else
  echo "失敗したアプリ: ${failed[*]}" >&2
  exit 1
fi
