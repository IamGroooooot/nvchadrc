-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local userPlugins = require "custom.plugins"

M.plugins = {
   install = userPlugins,
}

return M
