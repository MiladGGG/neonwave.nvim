local nw = require("neonwave")
vim.opt.background = nw.get_background()
vim.g.colors_name = "neonwave"

package.loaded["neonwave.theme"] = nil

require("lush")(require("neonwave.theme"))
