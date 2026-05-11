--- Applies all highlight groups using palette keys only (no hex outside palette.lua).

local M = {}

function M.apply()
  local nw = require("neonwave")
  local P = nw.get_palette()
  local tr = nw.config.transparent_background
  local canvas = tr and "NONE" or P.bg
  local chrome = tr and "NONE" or P.statusline

  local hl = vim.api.nvim_set_hl
  ---@param name string
  ---@param opts vim.api.keyset.highlight
  local function h(name, opts)
    hl(0, name, opts)
  end

  h("Normal", { bg = canvas, fg = P.fg })
  h("NormalNC", { bg = canvas, fg = P.fg_dim })
  h("NormalFloat", { bg = P.surface, fg = P.fg })
  h("FloatBorder", { fg = P.border, bg = P.surface })
  h("FloatTitle", { fg = P.float_title, bg = P.surface, bold = true })

  h("Cursor", { bg = P.pink, fg = P.cursor_fg })
  h("lCursor", { link = "Cursor" })
  h("CursorIM", { link = "Cursor" })
  h("CursorLine", { bg = P.cursor_line })
  h("CursorColumn", { bg = P.cursor_line })
  h("ColorColumn", { bg = P.surface_elevated })
  h("LineNr", { fg = P.line_nr, bg = canvas })
  h("LineNrAbove", { link = "LineNr" })
  h("LineNrBelow", { link = "LineNr" })
  h("CursorLineNr", { fg = P.line_nr_cursor, bold = true })
  h("SignColumn", { bg = canvas, fg = P.line_nr })
  h("FoldColumn", { fg = P.comment, bg = canvas })
  h("Folded", { fg = P.comment, bg = P.surface })

  h("StatusLine", { bg = chrome, fg = P.fg })
  h("StatusLineNC", { bg = chrome, fg = P.fg_dim })
  h("TabLine", { bg = chrome, fg = P.fg_dim })
  h("TabLineFill", { bg = chrome })
  h("TabLineSel", { bg = P.tabline_sel, fg = P.pink, bold = true })
  h("WinBar", { bg = canvas, fg = P.fg_dim })
  h("WinBarNC", { bg = canvas, fg = P.comment })

  h("VertSplit", { fg = P.border, bg = canvas })
  h("Winseparator", { link = "VertSplit" })

  h("Pmenu", { bg = P.pmenu, fg = P.fg })
  h("PmenuSel", { bg = P.pmenu_sel, fg = P.fg })
  h("PmenuSbar", { bg = P.surface })
  h("PmenuThumb", { bg = P.pmenu_thumb })
  h("WildMenu", { bg = P.wildmenu, fg = P.fg })

  h("Visual", { bg = P.visual })
  h("VisualNOS", { link = "Visual" })
  h("Search", { bg = P.search, fg = P.fg })
  h("CurSearch", { bg = P.inc_search, fg = P.on_search, bold = true })
  h("IncSearch", { link = "CurSearch" })
  h("Substitute", { link = "Search" })

  h("Directory", { fg = P.cyan })
  h("Title", { fg = P.title, bold = true })
  h("Question", { fg = P.cyan })
  h("MoreMsg", { fg = P.cyan })
  h("ModeMsg", { fg = P.pink })
  h("MsgArea", { link = "Normal" })
  h("MsgSeparator", { fg = P.border })

  h("ErrorMsg", { fg = P.error, bold = true })
  h("WarningMsg", { fg = P.warn, bold = true })

  h("MatchParen", {
    bg = P.match_paren_bg,
    fg = P.pink_glow,
    sp = P.match_paren_sp,
    bold = true,
    undercurl = true,
  })

  h("NonText", { fg = P.eob })
  h("EndOfBuffer", { link = "NonText" })
  h("Whitespace", { fg = P.whitespace })
  h("SpecialKey", { fg = P.special })

  h("SpellBad", { sp = P.error, undercurl = true })
  h("SpellCap", { sp = P.warn, undercurl = true })
  h("SpellLocal", { sp = P.info, undercurl = true })
  h("SpellRare", { sp = P.hint, undercurl = true })

  h("DiffAdd", { bg = P.added })
  h("DiffChange", { bg = P.changed })
  h("DiffDelete", { bg = P.deleted })
  h("DiffText", { bg = P.surface_elevated, fg = P.cyan_glow })

  h("QuickFixLine", { bg = P.cursor_line })

  h("Comment", { fg = P.comment, italic = true })
  h("Constant", { fg = P.purple })
  h("String", { fg = P.string })
  h("Character", { link = "String" })
  h("Number", { fg = P.number })
  h("Boolean", { fg = P.boolean })
  h("Float", { link = "Number" })

  h("Identifier", { fg = P.fg })
  h("Function", { fg = P.cyan, bold = true })

  h("Statement", { fg = P.pink })
  h("Conditional", { link = "Statement" })
  h("Repeat", { link = "Statement" })
  h("Label", { fg = P.magenta })
  h("Operator", { fg = P.operator })
  h("Keyword", { fg = P.pink, bold = true })
  h("Exception", { link = "Keyword" })

  h("PreProc", { fg = P.magenta })
  h("Include", { link = "PreProc" })
  h("Define", { link = "PreProc" })
  h("Macro", { link = "PreProc" })
  h("PreCondit", { link = "PreProc" })

  h("Type", { fg = P.purple, bold = true })
  h("StorageClass", { link = "Type" })
  h("Structure", { link = "Type" })
  h("Typedef", { link = "Type" })

  h("Special", { fg = P.special })
  h("SpecialChar", { link = "Special" })
  h("Tag", { fg = P.cyan_glow })
  h("Delimiter", { fg = P.delimiter })
  h("SpecialComment", { link = "Comment" })
  h("Debug", { link = "Special" })

  h("Underlined", { fg = P.cyan, underline = true })
  h("Ignore", { fg = P.bg })
  h("Error", { fg = P.error, bg = P.surface, bold = true })
  h("Todo", { fg = P.warn, bg = P.surface, bold = true, italic = true })

  h("LspReferenceText", { bg = P.visual })
  h("LspReferenceRead", { link = "LspReferenceText" })
  h("LspReferenceWrite", { bg = P.search })
  h("LspCodeLens", { fg = P.comment, italic = true })
  h("LspCodeLensSeparator", { fg = P.border })
  h("LspSignatureActiveParameter", { fg = P.cyan_glow, bold = true, underline = true })

  h("DiagnosticError", { fg = P.error })
  h("DiagnosticWarn", { fg = P.warn })
  h("DiagnosticInfo", { fg = P.info })
  h("DiagnosticHint", { fg = P.hint })
  h("DiagnosticOk", { fg = P.ok })

  h("DiagnosticVirtualTextError", { fg = P.error, bg = P.surface })
  h("DiagnosticVirtualTextWarn", { fg = P.warn, bg = P.surface })
  h("DiagnosticVirtualTextInfo", { fg = P.info, bg = P.surface })
  h("DiagnosticVirtualTextHint", { fg = P.hint, bg = P.surface })
  h("DiagnosticVirtualTextOk", { fg = P.ok, bg = P.surface })

  h("DiagnosticUnderlineError", { sp = P.error, undercurl = true })
  h("DiagnosticUnderlineWarn", { sp = P.warn, undercurl = true })
  h("DiagnosticUnderlineInfo", { sp = P.info, undercurl = true })
  h("DiagnosticUnderlineHint", { sp = P.hint, undercurl = true })
  h("DiagnosticUnderlineOk", { sp = P.ok, undercurl = true })

  h("DiagnosticFloatingError", { link = "DiagnosticError" })
  h("DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
  h("DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
  h("DiagnosticFloatingHint", { link = "DiagnosticHint" })
  h("DiagnosticFloatingOk", { link = "DiagnosticOk" })

  h("DiagnosticSignError", { fg = P.error })
  h("DiagnosticSignWarn", { fg = P.warn })
  h("DiagnosticSignInfo", { fg = P.info })
  h("DiagnosticSignHint", { fg = P.hint })
  h("DiagnosticSignOk", { fg = P.ok })

  -- Treesitter
  h("@comment", { link = "Comment" })
  h("@punctuation", { link = "Delimiter" })
  h("@punctuation.bracket", { link = "Delimiter" })
  h("@punctuation.special", { link = "Special" })

  h("@constant", { link = "Constant" })
  h("@constant.builtin", { link = "Special" })
  h("@constant.macro", { link = "Define" })
  h("@string", { link = "String" })
  h("@string.escape", { link = "SpecialChar" })
  h("@string.special", { link = "SpecialChar" })
  h("@string.regexp", { link = "Special" })
  h("@character", { link = "Character" })
  h("@character.special", { link = "SpecialChar" })
  h("@number", { link = "Number" })
  h("@boolean", { link = "Boolean" })
  h("@float", { link = "Float" })

  h("@function", { link = "Function" })
  h("@function.builtin", { link = "Special" })
  h("@function.macro", { link = "Macro" })
  h("@function.call", { link = "Function" })
  h("@method", { link = "Function" })
  h("@method.call", { link = "Function" })

  h("@constructor", { link = "Type" })
  h("@parameter", { link = "Identifier" })
  h("@keyword", { link = "Keyword" })
  h("@keyword.function", { link = "Keyword" })
  h("@keyword.operator", { link = "Operator" })
  h("@keyword.return", { link = "Keyword" })
  h("@keyword.import", { link = "PreProc" })
  h("@keyword.export", { link = "PreProc" })
  h("@conditional", { link = "Conditional" })
  h("@repeat", { link = "Repeat" })
  h("@label", { link = "Label" })
  h("@operator", { link = "Operator" })
  h("@exception", { link = "Exception" })

  h("@type", { link = "Type" })
  h("@type.builtin", { link = "Type" })
  h("@type.definition", { link = "Typedef" })
  h("@type.qualifier", { link = "Statement" })
  h("@storageclass", { link = "StorageClass" })
  h("@attribute", { link = "PreProc" })
  h("@field", { fg = P.fg })
  h("@property", { link = "@field" })

  h("@variable", { link = "Identifier" })
  h("@variable.builtin", { link = "Special" })
  h("@variable.member", { link = "@field" })
  h("@variable.parameter", { link = "@parameter" })

  h("@namespace", { fg = P.purple_glow })
  h("@module", { link = "@namespace" })

  h("@text", { link = "Normal" })
  h("@text.literal", { link = "String" })
  h("@text.reference", { link = "Identifier" })
  h("@text.title", { link = "Title" })
  h("@text.uri", { link = "Underlined" })
  h("@text.underline", { link = "Underlined" })
  h("@text.todo", { link = "Todo" })
  h("@text.note", { link = "DiagnosticInfo" })
  h("@text.warning", { link = "DiagnosticWarn" })
  h("@text.danger", { link = "DiagnosticError" })

  h("@markup.heading", { link = "Title" })
  h("@markup.link", { link = "Underlined" })
  h("@markup.link.url", { fg = P.cyan, underline = true })
  h("@markup.list", { link = "Statement" })
  h("@markup.strong", { bg = canvas, fg = P.fg, bold = true })
  h("@markup.italic", { bg = canvas, fg = P.fg, italic = true })
  h("@markup.raw", { link = "String" })

  h("@tag", { link = "Tag" })
  h("@tag.attribute", { link = "@property" })
  h("@tag.delimiter", { link = "Delimiter" })

  h("@define", { link = "Define" })
  h("@macro", { link = "Macro" })
  h("@include", { link = "Include" })
  h("@preproc", { link = "PreProc" })
  h("@debug", { link = "Debug" })

  -- snacks.nvim picker
  h("SnacksPickerNormal", { bg = P.surface, fg = P.fg })
  h("SnacksPickerBorder", { link = "FloatBorder" })
  h("SnacksPickerTitle", { link = "FloatTitle" })
  h("SnacksPickerListCursorLine", { link = "CursorLine" })
  h("SnacksPickerCursorLine", { link = "CursorLine" })
  h("SnacksPickerSelected", { fg = P.number, bold = true })
  h("SnacksPickerGitStatus", { fg = P.fg_dim })
  h("SnacksPickerUnselected", { fg = P.fg_dim })
  h("SnacksPickerDimmed", { fg = P.comment })
  h("SnacksPickerDir", { fg = P.fg_dim })
  h("SnacksPickerPathIgnored", { fg = P.comment })
  h("SnacksPickerPathHidden", { fg = P.comment })
  h("SnacksPickerTotals", { fg = P.fg_dim })
  h("SnacksPickerKeymapRhs", { fg = P.fg_dim })
  h("SnacksPickerBufFlags", { fg = P.fg_dim })
  h("SnacksPickerGitStatusIgnored", { fg = P.comment })
  h("SnacksPickerGitStatusUntracked", { fg = P.line_nr })
  h("SnacksPickerFile", { fg = P.fg })
  h("SnacksPickerSpecial", { fg = P.magenta })
  h("SnacksPickerLabel", { link = "SnacksPickerSpecial" })
  h("SnacksPickerPrompt", { bg = P.surface, fg = P.cyan })
  h("SnacksPickerMatch", { bg = P.surface, fg = P.pink, bold = true })
  h("SnacksPickerInputSearch", { bg = P.surface, fg = P.pink, bold = true })

  -- Neo-tree
  h("NeoTreeNormal", { link = "Normal" })
  h("NeoTreeNormalNC", { link = "NormalNC" })
  h("NeoTreeCursorLine", { link = "CursorLine" })
  h("NeoTreeRootName", { fg = P.pink, bold = true })
  h("NeoTreeDirectoryName", { fg = P.cyan })
  h("NeoTreeDirectoryIcon", { fg = P.cyan })
  h("NeoTreeFileName", { fg = P.fg })
  h("NeoTreeFileIcon", { fg = P.fg_dim })
  h("NeoTreeSymbolicLinkTarget", { fg = P.magenta, underline = true })
  h("NeoTreeIndentMarker", { fg = P.border })
  h("NeoTreeExpander", { fg = P.comment })
  h("NeoTreeTitleBar", { link = "StatusLine" })
  h("NeoTreeTabActive", { fg = P.pink, bg = P.surface_elevated, bold = true })
  h("NeoTreeTabInactive", { fg = P.fg_dim, bg = P.surface })
  h("NeoTreeTabSeparatorActive", { fg = P.border, bg = P.surface_elevated })
  h("NeoTreeTabSeparatorInactive", { fg = P.border, bg = P.surface })

  h("NeoTreeGitAdded", { fg = P.ok })
  h("NeoTreeGitDeleted", { fg = P.error })
  h("NeoTreeGitModified", { fg = P.warn })
  h("NeoTreeGitConflict", { fg = P.magenta, bold = true })
  h("NeoTreeGitIgnored", { fg = P.comment })
  h("NeoTreeGitUntracked", { fg = P.hint })
  h("NeoTreeGitStaged", { fg = P.cyan })

  h("NeoTreeFloatTitle", { link = "FloatTitle" })
  h("NeoTreeFloatBorder", { link = "FloatBorder" })
  h("NeoTreeMessage", { fg = P.fg_dim })
  h("NeoTreeDimText", { fg = P.comment })
  h("NeoTreeFilterTerm", { fg = P.pink, bold = true })
end

return M
