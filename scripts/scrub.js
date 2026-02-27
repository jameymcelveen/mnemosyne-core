const fs = require('fs');
const path = require('path');
const chalk = require('chalk');

const targets = ['node_modules', 'dist', 'build', '.expo', '.next'];

function scrub(dir) {
  const files = fs.readdirSync(dir);
  files.forEach(file => {
    const fullPath = path.join(dir, file);
    if (targets.includes(file)) {
      console.log(chalk.red(`🗑  Removing: ${fullPath}`));
      fs.rmSync(fullPath, { recursive: true, force: true });
    } else if (fs.lstatSync(fullPath).isDirectory()) {
      scrub(fullPath);
    }
  });
}

console.log(chalk.yellow.bold('\n--- MNEMOSYNE DEEP SCRUB ---'));
scrub(process.cwd());
console.log(chalk.green.bold('✨ Workspace is pristine.\n'));