return {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup({
      -- Your setup opts here (leave empty to use defaults)
      symbols = {
        icon_fetcher = function(k, buf)
          local ft = vim.api.nvim_buf_get_option(buf, "ft")
          if ft == "quarto" then
            return ""
          end
          return false
        end,
      },
      providers = {
        priority = { "lsp", "coc", "markdown", "norg", "man" },
        lsp = {
          -- Lsp client names to ignore
          blacklist_clients = {},
        },
        markdown = {
          -- List of supported ft's to use the markdown provider
          filetypes = { "markdown", "quarto", "qmd" },
        },
      },
    })
  end,
  depedencies = {
    "epheien/outline-treesitter-provider.nvim",
  },
}
