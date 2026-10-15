---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: Header
  text: Headers that write themselves
  tagline: Simple, scalable script headers for Roblox Studio.
  actions:
    - theme: brand
      text: Get Started
      link: /guides/getting-started
    - theme: alt
      text: View on GitHub
      link: https://github.com/vvacillator/Header

features:
  - title: Simple
    details: Header uses a small, readable syntax
  - title: Composable
    details: Headers can be embedded inside other headers
  - title: Automatic
    details: New scripts get a header automatically based on their class
---

## Write it once

::: code-group
```txt [headers.hdr]
const writer: "Ayden"
const date: "MMM Do, YYYY"

[Trigger: "header"]
header Main: {
   -- {writer}
   -- {date}
}
```

```luau [Output]
-- Ayden
-- Oct 15th, 2026
```
:::