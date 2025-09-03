-- ~/.config/nvim/lua/plugins/ltex.lua
return {
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "quarto", "rmd", "rmarkdown", "tex" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          filetypes = { "markdown", "quarto", "rmd", "rmarkdown", "tex" },
          flags = { debounce_text_changes = 800 },
          settings = {
            ltex = {
              language = "en-GB",
              checkFrequency = "save",
              additionalRules = { enablePickyRules = true },
              dictionary = {
                ["en-GB"] = { ":" .. vim.fn.expand("~/.config/nvim/spell/en.utf-8.add") },
              },
            },
          },
          on_attach = function(client, bufnr)
            vim.diagnostic.config({ update_in_insert = false })

            require("ltex_extra").setup({
              load_langs = { "en-GB" },
              init_check = true,
              path = vim.fn.expand("~/.local/share/ltex"),
              log_level = "warn",
            })

            local function ltex_check_now()
              for _, c in pairs(vim.lsp.get_clients({ bufnr = bufnr, name = "ltex" })) do
                c:notify("textDocument/didSave", { textDocument = { uri = vim.uri_from_bufnr(bufnr) } })
              end
            end
            local grp = vim.api.nvim_create_augroup("LtexCheck_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd("BufReadPost", { buffer = bufnr, group = grp, callback = ltex_check_now })
            vim.api.nvim_create_autocmd("InsertLeave", { buffer = bufnr, group = grp, callback = ltex_check_now })

            vim.api.nvim_buf_create_user_command(bufnr, "LtexCheckNow", ltex_check_now, {})
          end,
        },
      },
    },
  },
}
