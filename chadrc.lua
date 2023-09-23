---@type ChadrcConfig
local M = {}

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

M.ui = { theme = "onedark" }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
