import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Header",
  description: "Script snippets for Roblox Studio",
  base: "/Header/",
  appearance: "dark",
  head: [
    ['link', { rel: 'icon', href: '/Header/icon.png' }]
  ],
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: '/icon.png',
    search: { provider: 'local' },

    nav: [
      { text: 'Home', link: '/' },
    ],

    sidebar: [
      {
        text: 'Guides',
        items: [
          { text: 'Getting Started', link: '/guides/getting-started' },
          { text: 'Your First Header', link: '/guides/first-header' }
        ]
      },
      {
        text: 'Syntax',
        items: [
          { text: 'Constants', link: '/syntax/constants' },
          { text: 'Triggers', link: '/syntax/triggers' },
          { text: 'Built-ins', link: '/syntax/built-ins' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/vvacillator/Header' }
    ]
  }
})