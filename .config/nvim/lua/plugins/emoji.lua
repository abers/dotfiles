return {
  "allaman/emoji.nvim",
  config = function(_, opts)
    local emoji = require("emoji")
    emoji.setup(opts)

    vim.keymap.set({ "n", "i" }, "<M-e>", function()
      emoji.insert()
    end, { desc = "Emoji picker (Snacks)" })
  end,
}
