-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    [";"] = { "<cmd>:HopWord<cr>", desc = "Hop" },
    ["'"] = { "<cmd>:HopAnywhere<cr>", desc = "Hop!!" },
    ["\\"] = { "<C-w>v", desc = "Vertical Split" },
    ["-"] = { "<C-w>s", desc = "Horizontal Split" },
    ["<leader>j"] = { "<C-i>", desc = "jump in"},
    ["<leader>k"] = { "<C-o>", desc = "jump out"},
    ["<tab>"] = { "<cmd>:q<cr>", desc = "Quit" },
    ["<esc>"] = { "^", desc = "go to first non-space" },
    ["t"] = { "<C-w>s<cmd>:terminal<cr>" },
    ["T"] = { "<C-w>v<cmd>:terminal<cr>" },
    ["<C-t>"] = { "<cmd>:terminal<cr>" },
    ["H"] = { "<cmd>:bprevious<cr>", desc = "Prev Buffer" },
    ["L"] = { "<cmd>:bnext<cr>", desc = "Next Buffer" },
    ["w"] = { function() require("nvim-window").pick() end, desc = "pick window" },
    [","] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["="] = {
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      desc = "Find all files",
    },
    ["<leader>fml"] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Fuck my life" },
    ["<leader>;"] = { "<cmd>:edit!<cr>", desc = "Reload buffer" },
    ["<leader>pp"] = { "<cmd>:Telescope projects<cr>", desc = "Telescope projects" },
    ["<leader>lx"] = { "<cmd>:LspRestart<cr>", desc = "LSP Restart" },
    ["<leader>fR"] = { function() require("spectre").open() end, desc = "Spectre search & replace" },
    ["<C-s>"] = { "<cmd>:w!<cr>", desc = "Save File" },
    ["<C-b>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },

  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>" },
  },
  i = {
    ["<C-d><C-b>"] = { "import ipdb; ipdb.set_trace(context=5)" , desc = "debug"},
  },
}
