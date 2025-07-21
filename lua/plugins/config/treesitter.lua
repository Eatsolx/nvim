require("nvim-treesitter.configs").setup({
  indent = {
    enable = true,
  },
  refactor = {
    smart_rename = { enable = true },
    highlight_definitions = { enable = true }
  }
})
