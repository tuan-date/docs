const fs = require('fs-extra');

async function copyClientsFiles() {
  await fs.copy('docs/clients', '.vitepress/dist/clients');
  console.log('Copied clients files');
}

copyClientsFiles();