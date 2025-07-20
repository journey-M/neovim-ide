local dap = require('dap')
require("mason-nvim-dap").setup()
require('dapui').setup()
local dapui = require('dapui')
--  dapui.setup()


dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

  -- On windows you may have to uncomment this:
  -- detached = false,
}

dap.configurations.cpp= {
  {
  type = 'codelldb';
  request = 'launch';
  name = "Launch file";
    program = function()
      local path = vim.fn.input({
        prompt = 'Path to executable: ',
        default = vim.fn.getcwd() .. '/',
        completion = 'file'
      })
      return (path and path ~= "") and path or dap.ABORT
    end
  },
  {
  type = 'codelldb';
  request = 'attach';
  name = 'Attach';
  processId= require('dap.utils').pick_process;
  program = function()
      local path = vim.fn.input({
        prompt = 'Path to executable: ',
        default = vim.fn.getcwd() .. '/',
        completion = 'file'
      })
      return (path and path ~= "") and path or dap.ABORT
    end
}
}
local keymap = vim.keymap.set
-- dap config  --
keymap('n', '<leader>dr',  dap.repl.toggle,{desc='terminate'})
keymap('n', '<leader>dk',  dap.terminate, {desc='terminate'})
keymap('n', '<leader>dp',  dap.pause, {desc='pause'})
keymap('n', '<leader>dl',  dap.run_last, {desc='run last'})

keymap('n', '<F5>',  dap.step_over )
keymap('n', '<F6>',  dap.step_into)
keymap('n', '<F7>',  dap.step_out)
keymap('n', '<F8>',  dap.continue, {desc="run/continue"})
keymap('n', '<F9>',  dap.toggle_breakpoint)

keymap('n', '<leader>duu',  dapui.open, {desc ="open dap-ui"})
keymap('n', '<leader>duc',  dapui.close, {desc ="close dap-ui"})
