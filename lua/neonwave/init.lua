---@class NeonWaveUserOpts
---@field intensity? "soft"|"neon"
---@field background? "dark"|"light"|"auto"
---@field transparent_background? boolean

---@class NeonWaveConfig
---@field intensity "soft"|"neon"
---@field background "dark"|"light"|"auto"
---@field transparent_background boolean

local M = {}

---@type NeonWaveConfig
M.config = {
  intensity = "neon",
  background = "auto",
  transparent_background = false,
}

--- Map Neovim's global `'background'` option to a palette family. Read-only; never mutates `vim.o.background`.
---@return "dark"|"light"
local function palette_from_background_option()
  return vim.o.background == "light" and "light" or "dark"
end

---@param opts? NeonWaveUserOpts
function M.setup(opts)
  opts = opts or {}
  if opts.intensity == "soft" or opts.intensity == "neon" then
    M.config.intensity = opts.intensity
  end
  local bg = opts.background
  if bg == "dark" or bg == "light" or bg == "auto" then
    ---@cast bg "dark"|"light"|"auto"
    M.config.background = bg
  end
  if opts.transparent_background ~= nil then
    M.config.transparent_background = not not opts.transparent_background
  end
end

---@return "soft"|"neon"
function M.get_intensity()
  local i = M.config.intensity
  if i ~= "soft" and i ~= "neon" then
    return "soft"
  end
  return i
end

--- Resolved palette background: `"dark"` / `"light"` from config, or from `vim.o.background` when config is `"auto"`.
---@return "dark"|"light"
function M.get_background()
  local b = M.config.background
  if b == "dark" or b == "light" then
    return b
  end
  if b == "auto" then
    return palette_from_background_option()
  end
  return "dark"
end

---@return table
function M.get_palette()
  local palettes = require("neonwave.palette")
  return palettes[M.get_background()][M.get_intensity()]
end

--- Apply all highlight groups via `vim.api.nvim_set_hl`.
--- Call after `setup()`. Used by `:colorscheme neonwave` via `colors/neonwave.lua`.
function M.load()
  vim.cmd.highlight("clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
  end
  package.loaded["neonwave.theme"] = nil
  require("neonwave.theme").apply()
end

return M
