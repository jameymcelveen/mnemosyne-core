/**
 * scripts/scaffold.js
 * The "Senior Architect" Generator
 */
const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const type = process.argv[2]; // 'app' or 'package'
const name = process.argv[3];

if (!type || !name) {
  console.log(chalk.red('Usage: node scripts/scaffold.js [app|package] [name]'));
  process.exit(1);
}

const targetDir = path.join(process.cwd(), type === 'app' ? 'apps' : 'packages', name);

if (fs.existsSync(targetDir)) {
  console.log(chalk.yellow(`⚠ ${name} already exists.`));
} else {
  fs.mkdirSync(targetDir, { recursive: true });
  fs.writeFileSync(path.join(targetDir, 'package.json'), JSON.stringify({
    name: `@mnemosyne/${name}`,
    version: '1.0.0',
    private: true
  }, null, 2));
  console.log(chalk.green(`✔ Successfully scaffolded ${type}: ${name}`));
}