return {
  "hedyhli/outline.nvim",
  keys = {
    { "<M-o>", "<cmd>Outline<CR>", desc = "Toggle Outline" },
  },
  config = function()
    require("outline").setup({
      symbols = {
        icon_fetcher = function(_, bufnr)
          local ft = vim.api.nvim_get_option_value("ft", { buf = bufnr })
          if ft == "quarto" then
            return ""
          end
          return false
        end,
      },
      providers = {
        priority = { "markdown", "lsp", "coc", "norg", "man" },
        lsp = {
          blacklist_clients = {},
        },
        markdown = {
          filetypes = { "markdown", "quarto", "qmd", "rmd", "rmarkdown" },
        },
      },
    })
  end,
  dependencies = {
    "epheien/outline-treesitter-provider.nvim",
  },
}
