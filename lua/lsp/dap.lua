local dap = require('dap')
require('dapui').setup()


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
  }
}

