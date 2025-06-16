-- markdown预览
return {
  "toppair/peek.nvim",
  event = "VeryLazy",
  build = "deno task --quiet build:fast",
  config = function()
      require "plugins.config.peek"
  end,
}
