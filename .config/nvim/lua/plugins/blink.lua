return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      preset = "default",

      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up" },
      ["<C-d>"] = { "scroll_documentation_down" },
      ["<C-h>"] = { "hide" },

      ["<CR>"] = { "fallback" },

      ["<Tab>"] = {
        "snippet_forward",
        "select_and_accept",
        "fallback",
      },

      ["<S-Tab>"] = {
        "snippet_backward",
        "fallback",
      },

      ["<C-Space>"] = {
        "show",
        "show_documentation",
        "hide_documentation",
      },

      ["<M-s>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
          return true
        end,
        "fallback",
      },
      ["<M-p>"] = {
        function(cmp)
          cmp.show({ providers = { "path" } })
          return true
        end,
        "fallback",
      },
    }

    opts.enabled = function()
      if vim.bo.buftype == "prompt" then
        return false
      end
      if vim.b.completion == false then
        return false
      end
      return true
    end

    opts.completion = opts.completion or {}
    opts.completion.menu = opts.completion.menu or {}

    local orig_auto_show = opts.completion.menu.auto_show

    opts.completion.menu.auto_show = function(ctx)
      local ft = (ctx and ctx.filetype) or vim.bo.filetype

      --    disable auto-show for quarto except in code chunks
      if ft ~= "quarto" then
        if type(orig_auto_show) == "function" then
          return orig_auto_show(ctx)
        elseif orig_auto_show ~= nil then
          return orig_auto_show
        else
          return true
        end
      end

      local ok, node = pcall(vim.treesitter.get_node)
      if not ok or not node then
        return false
      end

      while node do
        local t = node:type()
        if t == "fenced_code_block" or t == "code_fence_content" or t == "indented_code_block" then
          return true -- auto-popup *inside* code chunks
        end
        node = node:parent()
      end

      return false
    end
  end,
}
