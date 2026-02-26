#!/usr/bin/env bash
# exit on error
set -o errexit

# npmとbundleのインストール
npm install
bundle install

# アセットのプリコンパイル
bundle exec rake assets:precompile
bundle exec rake assets:clean

# データベースマイグレーションの実行
bundle exec rake db:migrate
