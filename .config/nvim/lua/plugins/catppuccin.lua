return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "LazyVim/LazyVIm",
    opts = {
      colorscheme = "catppuccin-macchiato",
      integrations = { blink_cmp = true },
    },
  },
}
