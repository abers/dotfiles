-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function edit_snippet_file(ft)
  local config = vim.fn.stdpath("config")
  local dir = config .. "/snippets"
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  local name = ft or vim.bo.filetype
  if not name or name == "" then
    name = "global"
  end

  local file = dir .. "/" .. name .. ".json"

  if vim.fn.filereadable(file) == 0 then
    vim.fn.writefile({
      "{",
      '  "example": {',
      '    "prefix": "example",',
      '    "body": [',
      '      "$0"',
      "    ],",
      '    "description": "Example snippet"',
      "  }",
      "}",
    }, file)
  end

  vim.cmd.edit(file)
end

vim.keymap.set("n", "<leader>ze", function()
  edit_snippet_file()
end, { desc = "Edit snippets for current filetype" })

vim.keymap.set("n", "<leader>zg", function()
  edit_snippet_file("global")
end, { desc = "Edit global snippets" })
