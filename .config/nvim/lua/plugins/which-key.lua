return {
  "folke/which-key.nvim",
  optional = true,
  opts = function(_, opts)
    opts.spec = opts.spec or {}

    table.insert(opts.spec, {
      "<leader>r",
      group = "REPL",
    })

    table.insert(opts.spec, {
      "<leader>cq",
      group = "Quarto",
    })

    table.insert(opts.spec, {
      "<leader>z",
      group = "Snippets",
    })

    vim.list_extend(opts.spec, {
      { "<leader>rt", desc = "Iron: toggle REPL" },
      { "<leader>rr", desc = "Iron: restart REPL" },
      { "<leader>rl", desc = "Iron: send line" },
      { "<leader>rm", desc = "Iron: send motion" },
      { "<leader>rv", desc = "Iron: send selection" },
      { "<leader>ra", desc = "Iron: send file" },
      { "<leader>ru", desc = "Iron: send until cursor" },
      { "<leader>ric", desc = "Iron: send code block" },
      { "<leader>rn", desc = "Iron: send block & move" },
      { "<leader>r<space>", desc = "Iron: interrupt REPL" },
      { "<leader>rq", desc = "Iron: quit REPL" },
      { "<leader>rC", desc = "Iron: clear REPL" },
      { "<leader>rf", desc = "Iron: focus REPL window" },
      { "<leader>rh", desc = "Iron: hide REPL window" },
      { "<leader>rT", desc = "Quarto: toggle R/P Iron" },
    })
  end,
}
