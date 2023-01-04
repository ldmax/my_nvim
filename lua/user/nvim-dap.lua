local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

-- Note: for windows, EXE has to be capitalized
local python_exe = "C:/Program Files/Python310/pythonw.EXE"

dap.adapters.python = {
  type = 'executable';
  command = python_exe;
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = python_exe
  },
}


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<space>dtb', '<cmd>DapToggleBreakpoint<cr>', opts)
keymap('n', '<space>dc', '<cmd>DapContinue<cr>', opts)
keymap('n', '<space>dsi', '<cmd>DapStepInto<cr>', opts)
keymap('n', '<space>dr', '<cmd>DapStepOver<cr>', opts)
keymap('n', '<space>dt', '<cmd>DapStepOut<cr>', opts)
