# 客户端下载

由于 Matrix 开源与互联互通的特性，你可以使用任何支持 Matrix 协议的客户端来连接到 Tuan Chat。以下的客户端仅是 Matrix 客户端中的一部分，如果你有兴趣，你也可以尝试探索其他客户端，甚至自己开发一个客户端。

## 下载

你可以直接从下列链接下载最新版本的 SchildiChat 和 FluffyChat 客户端，文件托管在 IPFS 上，每个月与官方进行一次同步更新：

<table>
  <tr>
    <th>平台</th>
    <th>版本</th>
    <th>文件名</th>
    <th>下载链接</th>
  </tr>
  <tr id="sc-android">
    <td>SchildiChat Android</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="sc-windows-install">
    <td>SchildiChat Windows 安装版</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="sc-windows-portable">
    <td>SchildiChat Windows 绿色版</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="sc-macos">
    <td>SchildiChat macOS</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="sc-linux">
    <td>SchildiChat Linux</td>
    <td class="version"></td>
    <td class="filename"></td>
    <td class="link"></td>
  </tr>
  <tr id="fc-android">
    <td>FluffyChat Android</td>
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
updateVersionAndLink('sc-android', '/clients/json/schildichat-android-cid.json');
updateVersionAndLink('sc-windows-install', '/clients/json/schildichat-windows-install-cid.json');
updateVersionAndLink('sc-windows-portable', '/clients/json/schildichat-windows-portable-cid.json');
updateVersionAndLink('sc-macos', '/clients/json/schildichat-macos-cid.json');
updateVersionAndLink('sc-linux', '/clients/json/schildichat-linux-appimage-cid.json');
updateVersionAndLink('fc-android', '/clients/json/fluffychat-android-cid.json');
</script>

## SchildiChat

### 介绍

SchildiChat 是一个开源的 Fork 自 Element 的 Matrix 客户端，它相对于 Element 专注于提供更好的性能和更好的用户体验，优化了很多细节并增添了很多小功能而且可以在无法连接 ELement 官方实例的情况下使用。SchildiChat 由 SchildiChat 团队维护，目前支持 Android、Windows、macOS 和 Linux 等多个平台。

- SchildiChat 桌面版源代码： [GitHub](https://github.com/SchildiChat/schildichat-desktop)
- SchildiChat 移动版源代码： [GitHub](https://github.com/SchildiChat/SchildiChat-android)

### Android 应用商店（均需互联网络环境）

<a href="https://play.google.com/store/apps/details?id=de.spiritcroc.riotx" target="_blank"><img src="/assets/imgs/appstore/gplay.webp" width="25%" alt="Google Play"></a>

<a href="https://f-droid.org/zh_Hans/packages/de.spiritcroc.riotx/" target="_blank"><img src="/assets/imgs/appstore/fdroid.webp" width="25%" alt="F-Droid"></a>

> **关于 iOS 与 iPadOS 平台：**  
> 很遗憾，目前 SchildiChat 暂未提供 iOS 版本。不过，你可以在登录外区 Apple 账号的前提下安装 Element 或下面要介绍的 FluffyChat（当然如果你选择自签或通过越狱等手段，请自行探索）  
> <a href="https://apps.apple.com/us/app/element-messenger/id1083446067" target="_blank"><img src="/assets/imgs/appstore/appstore-badge.webp" width="25%" alt="App Store"></a>

## FluffyChat

### 介绍

FluffyChat 是一个开源的 Matrix 客户端，它专注于提供更好的用户体验，支持多种平台，包括 Android、iOS、Linux、macOS 和 Windows 等。FluffyChat 遵循 Material You 设计风格，在界面上更加圆润现代，同时在有些被阉割的国产手机无法安装 SchildiChat 的情况下，FluffyChat 也是一个不错的选择。目前 FluffyChat 暂不支持语音和通话的界面。

- FluffyChat 源代码： [GitHub](https://github.com/krille-chan/fluffychat)
  
### 应用商店（均需互联网络环境或外区账号）

<a href="https://play.google.com/store/apps/details?id=chat.fluffy.fluffychat" target="_blank"><img src="/assets/imgs/appstore/gplay.webp" width="25%" alt="Google Play"></a>

<a href="https://f-droid.org/zh_Hans/packages/chat.fluffy.fluffychat/" target="_blank"><img src="/assets/imgs/appstore/fdroid.webp" width="25%" alt="F-Droid"></a>

<a href="https://apps.apple.com/us/app/fluffychat/id1551469600" target="_blank"><img src="/assets/imgs/appstore/appstore-badge.webp" width="25%" alt="App Store"></a>
