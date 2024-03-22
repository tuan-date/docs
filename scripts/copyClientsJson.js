const fs = require('fs-extra');

async function copyJsonFiles() {
  await fs.copy('docs/clients', '.vitepress/dist/clients');
}

copyJsonFiles();