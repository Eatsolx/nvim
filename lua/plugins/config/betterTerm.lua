require('betterTerm').setup {
  prefix = "Term_",
  position = "bot",
  size = 18,
  startInserted = true,
  show_tabs = true,
  new_tab_mapping = "<A-t>",       -- Create new terminal
  jump_tab_mapping = "<C-S-$tab>",   -- Jump to tab terminal
  active_tab_hl = "TabLineSel",    -- Highlight group for active tab
  inactive_tab_hl = "TabLine",     -- Highlight group for inactive tabs
  new_tab_hl = "BetterTermSymbol", -- Highlight group for new term
  new_tab_icon = "+",              -- Icon for new term
  index_base = 0                   -- Index number for terminals 
}
