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
    "smoka7/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup {
        multi_windows = true,
      }
    end,
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
    -- -- disabling this because compliance issues...
    -- "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    -- event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup {
    --     suggestion = {
    --       auto_trigger = true,
    --       keymap = {
    --         accept = "<Right>",
    --       },
    --     },
    --   }
    -- end,
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
    "yorickpeterse/nvim-window",
    as = "nvim-window",
    lazy = false,
  },
  {
    "eandrju/cellular-automaton.nvim",
    as = "cellular-automaton",
    lazy = false,
  },

  -- { "ellisonleao/gruvbox.nvim", lazy = false },
  -- { "EdenEast/nightfox.nvim", lazy = false }, -- lazy
  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false,
    config = function() require("catppuccin").setup {} end,
  },
  {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    lazy = false,
    config = function() require("tokyonight").setup {} end,
  },
  {
    "navarasu/onedark.nvim",
    as = "onedark",
    lazy = false,
    config = function()
      require("onedark").setup {
        style = "warmer",
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    as = "kanagawa",
    lazy = false,
    config = function()
      require("kanagawa").setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      }
    end,
  },
  {
    "Alexis12119/nightly.nvim",
    as = "nightly",
    lazy = false,
    config = function()
      require("nightly").setup {
        transparent = false,
        styles = {
          comments = { italic = true },
          functions = { italic = false },
          variables = { italic = false },
          keywords = { italic = false },
        },
        highlights = {},
      }
    end,
  },
}
