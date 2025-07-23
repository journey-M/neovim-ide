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

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" } 
}

local dap = require("dap")
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  },
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

--[[ 
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
--]]

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
