return {
  {
    "mfussenegger/nvim-lint",
    ft = { "markdown", "quarto", "rmarkdown", "markdown.pandoc" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        markdown = { "vale" },
        ["markdown.pandoc"] = { "vale" },
        quarto = { "vale" },
        rmarkdown = { "vale" },
        rmd = { "vale" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
