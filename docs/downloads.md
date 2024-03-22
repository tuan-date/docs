# Schildichat

SchildiChat 是一个开源的 Fork 自 Element 的 Matrix 客户端，它专注于提供更好的性能和更好的用户体验。SchildiChat 由 SchildiChat 团队维护，目前支持 Android、Windows、macOS 和 Linux 等多个平台。

- SchildiChat 桌面版源代码： [GitHub](https://github.com/SchildiChat/schildichat-desktop)
- SchildiChat 移动版源代码： [GitHub](https://github.com/SchildiChat/SchildiChat-android)

应用商店（均需互联网络环境）：

- [Google Play](https://play.google.com/store/apps/details?id=de.spiritcroc.riotx)
- [F-Droid](https://f-droid.org/packages/de.spiritcroc.riotx/)

或者，你也可以直接从下列链接下载最新版本的 SchildiChat 客户端，文件托管在 IPFS 上，每个月与官方进行一次同步更新：

<table>
  <tr>
    <th>平台</th>
    <th>版本</th>
    <th>文件名</th>
    <th>下载链接</th>
  </tr>
  <tr id="android">
    <td>Android</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="windows-install">
    <td>Windows 安装版</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="windows-portable">
    <td>Windows 绿色版</td>
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
  const ipfsGateway = 'https://gateway.pinata.cloud';

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
      link.href = ipfsGateway + '/ipfs/' + latestCID + '/' + latestFilename;
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
