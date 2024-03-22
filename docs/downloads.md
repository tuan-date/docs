**Tuan Chat 客户端下载指南**

欢迎来到 Tuan Chat！作为一个支持端到端加密的联邦宇宙实例，我们致力于为用户提供安全、去中心化的聊天体验。为了让您能够尽快开始使用我们的服务，我们准备了以下的客户端下载指南。

### 1. **选择您的平台**

Tuan Chat 提供了多个平台的客户端应用程序，您可以根据自己的设备选择合适的版本。

- **网页端**：Cinny,Element
- **客户端**：Schildchat,Element

### 2. **下载客户端应用程序**

访问 Tuan Chat 的官方网站或者F-Droid应用商店，搜索并下载适用于您设备的客户端应用程序。


### 3. **安装客户端应用程序**

下载完成后，根据您设备的操作系统进行相应的安装步骤。通常情况下，您只需点击安装按钮并按照提示完成安装即可。

### 4. **启动客户端应用程序**

安装完成后，在您的设备上找到 Schildchat或者Element 的应用图标，点击打开应用程序。
### 5. **登录或注册账号**

如果您是新用户，请参考**注册**一文的指导，按照提示填写邀请码并创建账号。

### 6. **开始使用 Tuan Chat**

登录成功后，您将进入 Tuan Chat 的主界面，您可以在这里添加联系人、加入群组，或者开始与您的朋友和同事进行聊天。记得邀请更多的朋友加入 Tuan Chat，一起享受安全、去中心化的聊天体验！

<table>
  <tr>
    <th>平台</th>
    <th>版本</th>
    <th>文件名</th>
    <th>链接</th>
  </tr>
  <tr id="android">
    <td>Android</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="windows-install">
    <td>Windows Install</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="windows-portable">
    <td>Windows Portable</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="macos">
    <td>macOS</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="linux">
    <td>Linux</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
</table>

<script>
function updateVersionAndLink(platform, apiURL) {
  // IPFS 网关地址
  const ipfsGateway = 'https://gateway.pinata.cloud/ipfs/';

  // 获取数据
  fetch(apiURL)
    .then(response => response.json())
    .then(data => {
      // 获取最新版本的 CID 和文件名
      const latestCID = data.latest.cid;
      const latestFilename = data.latest.name;

      // 通过 CID 匹配找到最新的版本号
      const latestVersion = data.versions.find(version => version.cid === latestCID).version;

      // 更新表格
      const row = document.getElementById(platform);
      const versionCell = row.querySelector('.version');
      const filenameCell = row.querySelector('.filename');
      const linkCell = row.querySelector('.link');

      // 更新版本列
      versionCell.textContent = latestVersion;

      // 更新文件名列
      filenameCell.textContent = latestFilename;

      // 更新链接列
      const link = document.createElement('a');
      link.href = ipfsGateway + 'ipfs/' + latestCID + '/' + latestFilename;
      link.textContent = '下载';
      link.className = 'download-button'; // 添加类名
      linkCell.appendChild(link);
    })
    .catch(error => console.error('Error:', error));
}

// 使用函数来更新每个平台的数据
updateVersionAndLink('android', '/clients/json/schildichat-android-cid.json');
updateVersionAndLink('windows-install', '/clients/json/schildichat-windows-install-cid.json');
updateVersionAndLink('windows-portable', '/clients/json/schildichat-windows-portable-cid.json');
updateVersionAndLink('macos', '/clients/json/schildichat-macos-cid.json');
updateVersionAndLink('linux', '/clients/json/schildichat-linux-appimage-cid.json');
</script>
