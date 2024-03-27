#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Installing dependencies..."
bundle install

echo "Running database migrations..."
rails db:migrate RAILS_ENV=production

echo "Precompiling assets..."
rails assets:precompile

echo "Cleaning up old assets..."
rails assets:clean