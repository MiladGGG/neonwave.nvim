# 🔮 neonwave.nvim

A **Neovim** colorscheme modelled after vaporwave aesthetics 📼. Characterised by bright contrasting neon colours 🌆

Initially created using **[lush.nvim](https://github.com/rktjmp/lush.nvim)**, then converted into a standalone raw Lua colorscheme for zero dependencies.

Give it a try! Leave a star if you find it amusing ⭐️

---

## Demo

![neondark](demo/neon.png)
![softdark](demo/soft.png)
![transparentdark](demo/transparent.png)

---

## Features

### Styles
**Two intensities**: 
- **`neon`** : Default. Bright, punchy, contrasting colours.
- **`soft`** : Same feel, softer colours. 

**Two modes Light/Dark** 
- **`light`** : Light mode with a pink tint.
- **`dark`** : Dark mode with a purple tint.

**Transparent Background** 
- **`false`** : Default. Solid background.
- **`true`** : Neovim will use your terminal background.

### Supported Plugins
Optimised for my personal Neovim config, [AstroNvim](https://github.com/astronvim/astronvim)
- **Treesitter** highlights
- **LSP diagnostics**, core UI (status line, tabs, floats, search) 
- **Neo-tree** (including source tabs)
- **`snacks.nvim` picker** highlights tuned for readability on both backgrounds.

PS, feel free to add your own with a pull request.

---

## Requirements

- **Neovim** 0.8+ (0.9+ recommended for Treesitter `@` captures)
- [`termguicolors`](https://neovim.io/doc/user/options.html#'termguicolors')

---

## Installation

Install from GitHub with your plugin manager.  

Always call **`require("neonwave").setup({ … })` before `colorscheme neonwave`** so intensity and background apply when `colors/neonwave.lua` runs.

### lazy.nvim

```lua
{
  "miladggg/neonwave.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("neonwave").setup({
      intensity = "neon", -- 'soft' or 'neon'
      background = "dark", -- 'light' or dark'
      transparent_background = false, -- true or false
    })
  end,
}
```

Use **`lazy = false`** (or otherwise ensure this plugin loads before the first `:colorscheme`) so `setup()` runs before `colors/neonwave.lua`.

### packer.nvim

```lua
require("packer").startup(function(use)
  use({
    "miladggg/neonwave.nvim",
    config = function()
      require("neonwave").setup({
        intensity = "neon", -- 'soft' or 'neon'
        background = "dark", -- 'light' or dark'
        transparent_background = false, -- true or false
      })
    end,
  })
end)
```

### vim-plug

```vim
Plug 'miladggg/neonwave.nvim'

lua << EOF
require("neonwave").setup({
  intensity = "neon", -- 'soft' or 'neon'
  background = "dark", -- 'light' or dark'
  transparent_background = false, -- true or false
})
EOF
```

---

## Configuration

Pass options to **`require("neonwave").setup({ … })`**.

| Option | Type | Description |
|--------|------|-------------|
| `intensity` | `"soft"` \| `"neon"` | Brightness, contrast and colour saturation. |
| `background` | `"dark"` \| `"light"` | Light and Dark mode. |
| `transparent_background` | `boolean` | Allows terminal background image to be visible. |

### Examples

#### Neon Light:
```lua
require("neonwave").setup({
  intensity = "neon",
  background = "light",
})
vim.cmd.colorscheme("neonwave")
```

#### Soft Dark with a Transparent background:
```lua
require("neonwave").setup({
  intensity = "soft",
  background = "dark",
  transparent_background = true,
})
vim.cmd.colorscheme("neonwave")
```

---
## Setup
Complete installation and run:
```:colorscheme neonwave```

## Customizing colors

- All hex lives in **`lua/neonwave/palette.lua`**.
- **`lua/neonwave/theme.lua`** applies those tokens with **`vim.api.nvim_set_hl`**.

Feel free to go inside and change around the colours to your liking.

---


## Contributing

Issues and pull requests are welcome. See **[`CONTRIBUTING.md`](CONTRIBUTING.md)** for the contribution details.

