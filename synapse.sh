#!/bin/bash
# MNEMOSYNE CORE - SPRINT 1.6 (The GitHub Guard)

mkdir -p .github/workflows

echo "name: Mnemosyne CI
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Use Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
      - run: npm install
      - run: npm test" > .github/workflows/ci.yml

echo "CI Pipeline created. GitHub will now run your tests automatically on every push."