return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function() require("hop").setup {} end,
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      local gitlinker = require "gitlinker"
      gitlinker.setup {
        opts = {
          action_callback = gitlinker.copy_to_clipboard,
          print_url = true,
        },
        callbacks = {
          ["git.drwholdings.com"] = function(url_data)
            local url = "git.drwholdings.com/" .. url_data.repo .. "/blob/" .. url_data.rev .. "/" .. url_data.file
            if url_data.lstart then
              url = url .. "#L" .. url_data.lstart
              if url_data.lend then url = url .. "-L" .. url_data.lend end
            end
            return url
          end,
        },
        -- default mapping to call url generation with action_callback
        mappings = "<leader>gy",
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {
          "<C-u>",
          "<C-d>",
          "<C-b>",
          "<C-f>",
          "<C-y>",
          "<C-e>",
          "zt",
          "zz",
          "zb",
        },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = "cubic", -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }

      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100", [['cubic']] } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100", [['cubic']] } }
      -- Use the "circular" easing function
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100", [['circular']] } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100", [['circular']] } }
      -- Pass "nil" to disable the easing animation (constant scrolling speed)
      t["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } }
      t["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } }
      -- When no easing function is provided the default easing function (in this case "quadratic") will be used
      t["zt"] = { "zt", { "100" } }
      t["zz"] = { "zz", { "100" } }
      t["zb"] = { "zb", { "100" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
          },
        },
      }
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup {}
      require("telescope").load_extension "projects"
    end,
  },
  { "gcmt/wildfire.vim", lazy = false },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false,
    config = function() require("catppuccin").setup {} end,
  },
  {
    "nvim-pack/nvim-spectre",
    as = "spectre",
    lazy = false,
    config = function()
      require("spectre").setup {
        color_devicons = true,
        open_cmd = "vnew",
        live_update = false, -- auto execute search again when you write to any file in vim
        line_sep_start = "┌-----------------------------------------",
        result_padding = "¦  ",
        line_sep = "└-----------------------------------------",
        highlight = {
          ui = "String",
          search = "DiffChange",
          replace = "DiffDelete",
        },
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    lazy = false,
    config = function() require("tokyonight").setup {} end,
  },
}
