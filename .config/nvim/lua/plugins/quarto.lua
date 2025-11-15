return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto" },
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        opts = {
          buffers = { set_filetype = true, write_to_disk = true },
          lsp = { diagnostics = { update_in_insert = false } },
        },
      },
    },
    opts = {
      lspFeatures = {
        enabled = true,
        chunks = "curly",
      },
      codeRunner = {
        enabled = false, -- Quarto will NOT manage REPLs
        -- default_method = "iron",
      },
    },
    -- 👇 This is new: we wire Quarto + otter + Iron *here*
    config = function(_, opts)
      -- normal quarto-nvim setup
      require("quarto").setup(opts)

      -- try to load otter + iron
      local ok_keeper, keeper = pcall(require, "otter.keeper")
      local ok_iron, iron = pcall(require, "iron.core")
      if not (ok_keeper and ok_iron) then
        return
      end

      -- helper to set buffer-local <leader>rc in a given Quarto buffer
      local function set_quarto_mapping(bufnr)
        vim.keymap.set("n", "<leader>rc", function()
          local lines = keeper.get_language_lines_around_cursor()
          if not lines or #lines == 0 then
            vim.notify("otter: no language chunk around cursor", vim.log.levels.WARN)
            return
          end
          -- ft = nil so Iron uses its repl_filetype() hook to decide R vs Python
          iron.send(nil, lines)
        end, { buffer = bufnr, desc = "Quarto: run chunk via Iron" })
      end

      -- future Quarto buffers
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "quarto",
        callback = function(ev)
          set_quarto_mapping(ev.buf)
        end,
      })

      -- current buffer might already be Quarto when this runs
      if vim.bo.filetype == "quarto" then
        set_quarto_mapping(vim.api.nvim_get_current_buf())
      end
    end,

    keys = {
      {
        "<leader>cqp",
        "<cmd>QuartoPreview<cr>",
        desc = "Quarto Preview",
      },
      {
        "<leader>cqc",
        "<cmd>QuartoPreviewClose<cr>",
        desc = "Quarto Preview Close",
      },
      -- leave these commented so Quarto doesn't spawn its own REPL
      -- {
      --   "<leader>rl",
      --   function()
      --     require("quarto.runner").run_line()
      --   end,
      --   desc = "Quarto: run line",
      -- },
      -- {
      --   "<leader>rs",
      --   function()
      --     require("quarto.runner").run_selection()
      --   end,
      --   desc = "Quarto: run selection",
      --   mode = { "n", "v" },
      -- },
      -- {
      --   "<leader>rc",
      --   function()
      --     require("quarto.runner").run_cell()
      --   end,
      --   desc = "Quarto: run cell/chunk",
      -- },
      -- {
      --   "<leader>ra",
      --   function()
      --     require("quarto.runner").run_all()
      --   end,
      --   desc = "Quarto: run all",
      -- },
    },
  },

  {
    "Vigemus/iron.nvim",
    main = "iron.core",
    event = "VeryLazy",
    opts = function()
      local common = require("iron.fts.common")

      -- Buffer-local Quarto engine: "r" by default, "python" when toggled
      local function get_quarto_engine(bufnr)
        local ok, val = pcall(vim.api.nvim_buf_get_var, bufnr, "quarto_iron_chunks")
        if ok and (val == "r" or val == "python") then
          return val
        end
        return "r"
      end

      -- :QuartoIronToggle – flip between R and Python for this buffer
      vim.api.nvim_create_user_command("QuartoIronToggle", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local current = get_quarto_engine(bufnr)
        local new = (current == "r") and "python" or "r"
        vim.api.nvim_buf_set_var(bufnr, "quarto_iron_chunks", new)
        vim.notify("Quarto Iron engine: " .. new)
      end, {})

      local python_def = {
        command = { "ipython" },
        format = common.bracketed_paste_python,
        block_dividers = { "# %%", "#%%" },
        env = { PYTHON_BASIC_REPL = "1" },
      }

      local r_def = {
        command = { "R" },
      }

      return {
        config = {
          repl_definition = {
            python = python_def,
            r = r_def,
            quarto = {
              command = function(meta)
                local engine = get_quarto_engine(meta.current_bufnr)
                if engine == "python" then
                  return python_def.command
                else
                  return r_def.command
                end
              end,
            },
          },

          scratch_repl = true,
          dap_integration = true,
          repl_open_cmd = "botright 12split",
        },

        keymaps = {
          toggle_repl = "<leader>rt",
          restart_repl = "<leader>rr",
          send_line = "<leader>rl",
          send_motion = "<leader>rm",
          visual_send = "<leader>rv",
          send_file = "<leader>ra",
          send_until_cursor = "<leader>ru",
          send_code_block = "<leader>rc", -- overridden only in Quarto buffers
          send_code_block_and_move = "<leader>rn",
          interrupt = "<leader>r<space>",
          exit = "<leader>rq",
          clear = "<leader>rC",
        },

        highlight = { italic = true },
        ignore_blank_lines = true,
      }
    end,

    keys = {
      {
        "<leader>rT",
        function()
          if vim.bo.filetype == "quarto" then
            vim.cmd("QuartoIronToggle")
            vim.cmd("IronRestart")
          else
            vim.notify("QuartoIronToggle: current buffer is not a Quarto file", vim.log.levels.WARN)
          end
        end,
        desc = "Quarto: toggle R/P Iron and restart",
        mode = "n",
      },
      {
        "<leader>rf",
        "<cmd>IronFocus<cr>",
        desc = "Iron: focus REPL window",
        mode = "n",
      },
      {
        "<leader>rh",
        "<cmd>IronHide<cr>",
        desc = "Iron: hide REPL window",
        mode = "n",
      },
    },
  },

  { -- directly open ipynb files as quarto documents
    "GCBallesteros/jupytext.nvim",
    opts = {
      custom_language_formatting = {
        python = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
        r = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
      },
    },
  },

  { -- preview equations
    "jbyuki/nabla.nvim",
    keys = {
      { "<leader>um", ':lua require"nabla".toggle_virt()<cr>', desc = "toggle math equations" },
    },
  },

  { -- show images in nvim!
    "3rd/image.nvim",
    build = false,
    enabled = false,
    dev = false,
    ft = { "markdown", "quarto", "vimwiki" },
    cond = function()
      -- Disable on Windows system
      return vim.fn.has("win32") ~= 1
    end,
    config = function()
      local image = require("image")
      image.setup({
        backend = "kitty",
        processor = "magick_cli",
        integrations = {
          markdown = {
            enabled = true,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki", "quarto" },
          },
        },
        editor_only_render_when_focused = false,
        window_overlap_clear_enabled = true,
        tmux_show_only_in_active_window = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "scrollview", "scrollview_sign" },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 30,
        kitty_method = "normal",
      })

      local function clear_all_images()
        local bufnr = vim.api.nvim_get_current_buf()
        local images = image.get_images({ buffer = bufnr })
        for _, img in ipairs(images) do
          img:clear()
        end
      end

      local function get_image_at_cursor(buf)
        local images = image.get_images({ buffer = buf })
        local row = vim.api.nvim_win_get_cursor(0)[1] - 1
        for _, img in ipairs(images) do
          if img.geometry ~= nil and img.geometry.y == row then
            local og_max_height = img.global_state.options.max_height_window_percentage
            img.global_state.options.max_height_window_percentage = nil
            return img, og_max_height
          end
        end
        return nil
      end

      local function create_preview_window(img, og_max_height)
        local buf = vim.api.nvim_create_buf(false, true)
        local win_width = vim.api.nvim_get_option_value("columns", {})
        local win_height = vim.api.nvim_get_option_value("lines", {})
        local win = vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          style = "minimal",
          width = win_width,
          height = win_height,
          row = 0,
          col = 0,
          zindex = 1000,
        })
        vim.keymap.set("n", "q", function()
          vim.api.nvim_win_close(win, true)
          img.global_state.options.max_height_window_percentage = og_max_height
        end, { buffer = buf })
        return { buf = buf, win = win }
      end

      local function handle_zoom(bufnr)
        local img, og_max_height = get_image_at_cursor(bufnr)
        if img == nil then
          return
        end

        local preview = create_preview_window(img, og_max_height)
        image.hijack_buffer(img.path, preview.win, preview.buf)
      end

      vim.keymap.set("n", "<leader>io", function()
        local bufnr = vim.api.nvim_get_current_buf()
        handle_zoom(bufnr)
      end, { buffer = true, desc = "image open" })

      vim.keymap.set("n", "<leader>ic", clear_all_images, { desc = "image clear" })
    end,
  },
}
