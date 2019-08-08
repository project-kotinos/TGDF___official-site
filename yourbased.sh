#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata
gem install bundler -v 2.0.1
# before_install
nvm install 10.0.0
npm install -g yarn
# install
bundle install --jobs=3 --retry=3
# before_script
curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
chmod +x ./cc-test-reporter
./cc-test-reporter before-build
yarn install
bundle exec rake db:create
bundle exec rake db:schema:load
# script
bundle exec rubocop
bundle exec rspec
bundle exec brakeman

#after script
./cc-test-reporter after-build --exit-code 0
