const fs = require('fs-extra');

async function copyClientsFiles() {
  await fs.copy('clients-update/cid', 'docs/.vitepress/dist/cid');
  await fs.copy('clients-update/json', 'docs/.vitepress/dist/clients/json');
  console.log('Copied clients files');
}

copyClientsFiles();