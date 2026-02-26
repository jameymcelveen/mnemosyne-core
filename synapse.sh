#!/bin/bash
# MNEMOSYNE CORE - MONOREPO IGNITION (IDEMPOTENT)

# 1. Initialize Root package.json if it's missing or flat
if ! grep -q "workspaces" package.json 2>/dev/null; then
    echo "Initializing Monorepo Workspaces..."
    echo '{
  "name": "mnemosyne-core",
  "private": true,
  "workspaces": [
    "apps/*",
    "packages/*"
  ],
  "scripts": {
    "welcome": "node scripts/welcome.js",
    "test": "npm test --workspaces"
  },
  "devDependencies": {
    "chalk": "^4.1.2"
  }
}' > package.json
fi

# 2. Install Chalk for our automation
npm install --no-package-lock

# 3. Create the Directory Structure
mkdir -p apps/api apps/mobile packages/shared scripts

# 4. Migrate Shared Logic (Idempotent Move)
[ -f engine.ts ] && mv engine.ts packages/shared/
[ -f schema.json ] && mv schema.json packages/shared/

# 5. Initialize Shared Package
if [ ! -f packages/shared/package.json ]; then
    echo '{
  "name": "@mnemosyne/shared",
  "version": "1.0.0",
  "main": "index.ts",
  "private": true
}' > packages/shared/package.json
    echo "export * from './engine';" > packages/shared/index.ts
fi

# 6. Create the "Chalked" Welcome Script
echo "const chalk = require('chalk');
console.log(chalk.cyan.bold('\n--- MNEMOSYNE CORE: MONOREPO READY ---'));
console.log(chalk.green('✔ Workspaces: apps/api, apps/mobile, packages/shared'));
console.log(chalk.green('✔ Logic Migrated to @mnemosyne/shared'));
console.log(chalk.yellow('\nNext Step: ') + 'Run \"npm install\" to link local packages.');
console.log(chalk.dim('Stay strong, Jamey. Let the code be the distraction.\n'));" > scripts/welcome.js

# 7. Final Output
node scripts/welcome.js