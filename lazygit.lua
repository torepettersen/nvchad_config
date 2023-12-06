
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

local M = {}

M.toggle = function()
  lazygit:toggle()
end

return M
