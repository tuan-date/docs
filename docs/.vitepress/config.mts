import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Tuan Docs",
  description: "Tuan Chat Docs.",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: '首页', link: '/' },
      { text: '下载', link: '/downloads' },
      { text: '客户端', link: '/clients' },
      { text: 'Element', link: 'https://web.tuan.date' },
      { text: 'Cinny', link: 'https://cinny.tuan.date' }
    ],

    sidebar: [
      {
        text: '开始使用',
        items: [
          { text: '介绍', link: '/start' },
          { text: '注册', link: '/signup' },
          { text: '概念碎碎念', link: '/concepts' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/tuandate/docs' }
    ]
  }
})
