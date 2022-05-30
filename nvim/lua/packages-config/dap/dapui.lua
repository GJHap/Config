local util = require('util')
local prequire = util.prequire
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap

prequire('dapui', function(dapui)
   dapui.setup{}
   nnoremap('<Leader>du', dapui.toggle)
   nnoremap('<Leader>ds', function() dapui.float_element('stacks', { enter = true }) end)
   nnoremap('<Leader>dw', function() dapui.float_element('watches', { enter = true }) end)
   nnoremap('<Leader>dl', function() dapui.float_element('scopes', { enter = true }) end)
   nnoremap('<Leader>dp', function() dapui.float_element('breakpoints', { enter = true }) end)
   nnoremap('<Leader>dr', function() dapui.float_element('repl', { enter = true }) end)
   nnoremap('<Leader>dh', dapui.eval)
   vnoremap('<Leader>dh', dapui.eval)
end)
