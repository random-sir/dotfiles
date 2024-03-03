---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>gg"] = { ":LazyGit <CR>", "LazyGit"},
    ["<leader>l"] = { ":Lazy <CR>", "Lazy"},

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
