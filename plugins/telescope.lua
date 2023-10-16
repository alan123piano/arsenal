return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    local get_icon = require("astronvim.utils").get_icon
    return {
      defaults = {
        prompt_prefix = string.format("%s ", get_icon "Search"),
        selection_caret = string.format("%s ", get_icon "Selected"),
        path_display = { "full" },
        file_ignore_patterns = { "node_modules", ".mypy_cache", ".pyc", ".git", ".pytest_cache", "target" },
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            prompt_position = "top",
            preview = {
              preview_height = 0.5,
              preview_cutoff = 120,
            },
            mirror = true,
          },
          width = 0.9,
          height = 0.9,
        },

        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
          n = { ["q"] = actions.close },
        },
      },
    }
  end,
  config = require "plugins.configs.telescope",
}
