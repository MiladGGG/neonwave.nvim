local M = {}

M.config = {
  intensity = "neon",
  background = "light",
  transparent_background = false,
}

---@param opts? { intensity?: "soft"|"neon", background?: "dark"|"light", transparent_background?: boolean }
function M.setup(opts)
  opts = opts or {}
  if opts.intensity == "soft" or opts.intensity == "neon" then
    M.config.intensity = opts.intensity
  end
  if opts.background == "dark" or opts.background == "light" then
    M.config.background = opts.background
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

---@return "dark"|"light"
function M.get_background()
  local b = M.config.background
  if b ~= "dark" and b ~= "light" then
    return "dark"
  end
  return b
end

---@return table
function M.get_palette()
  local palettes = require("neonwave.palette")
  return palettes[M.get_background()][M.get_intensity()]
end

return M
