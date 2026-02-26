const chalk = require('chalk');
console.log(chalk.cyan.bold('\n--- MNEMOSYNE CORE: MONOREPO READY ---'));
console.log(chalk.green('✔ Workspaces: apps/api, apps/mobile, packages/shared'));
console.log(chalk.green('✔ Logic Migrated to @mnemosyne/shared'));
console.log(chalk.yellow('\nNext Step: ') + 'Run "npm install" to link local packages.');
console.log(chalk.dim('Stay strong, Jamey. Let the code be the distraction.\n'));
