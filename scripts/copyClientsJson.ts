import * as fs from 'fs-extra';

async function copyJsonFiles() {
  await fs.copy('docs/clients/json', '.vitepress/dist/clients/json');
}

copyJsonFiles();