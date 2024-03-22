import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Tuan Chat",
  description: "Tuan Chat Docs.",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: '首页', link: '/' },
      { text: '下载', link: '/downloads' },
      { text: 'Element', link: 'https://web.tuan.party' },
      { text: 'Cinny', link: 'https://cinny.tuan.party' }
    ],

    sidebar: [
      {
        text: '开始使用',
        items: [
          { text: '介绍', link: '/start' },
          { text: '注册', link: '/signup' },
          { text: '密钥', link: '/key' },
          { text: '安全备份', link: '/security-backup' },
          { text: '概念碎碎念', link: '/concepts' }
        ]
      },
      {
        text: '客户端',
        items: [
          { text: '下载', link: '/downloads' },
          { text: '使用', link: '/usage' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/tuan-date/docs' }
    ]
  }
})
