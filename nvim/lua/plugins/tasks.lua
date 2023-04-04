return {
  "Shatur/neovim-tasks",
  dependecies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
  },
  keys = {
    {"<leader>rcc", "<cmd>Task start cmake configure<cr>", desc = "configure cmake"},
    {"<leader>rct", "<cmd>Task set_module_param cmake target<cr>", desc = "set cmake target"},
    {"<leader>rca", "<cmd>Task set_task_param cmake run<cr>", desc = "set cmake arguments"},
    {"<leader>rcb", "<cmd>Task start cmake build<cr>", desc = "cmake build target"},
    {"<leader>rcr", "<cmd>Task start cmake run<cr>", desc = "cmake run target"},
    {"<leader>rcd", "<cmd>Task start cmake debug<cr>", desc = "cmake debug target"},
  },
  config = function()
    local Path = require('plenary.path')
    require('tasks').setup({
      default_params = {
                                                                             -- Default module parameters with which `neovim.json` will be created.
        cmake = {
          cmd = 'cmake',                                                     -- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
          build_dir = tostring(Path:new('{cwd}', 'build', '{os}-{build_type}')), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
          build_type = 'Debug',                                              -- Build type, can be changed using `:Task set_module_param cmake build_type`.
          dap_name = 'codelldb',                                                 -- DAP configuration name from `require('dap').configurations`. If there is no such configuration, a new one with this name as `type` will be created.
          args = {                                                           -- Task default arguments.
            configure = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
          },
        },
      },
      save_before_run = true,  -- If true, all files will be saved before executing a task.
      params_file = 'neovim.json', -- JSON file to store module and task parameters.
      quickfix = {
        pos = 'botright',      -- Default quickfix position.
        height = 12,           -- Default height.
      },
      dap_open_command = function()
        -- return false
        require("dapui").open()
        -- return require('dap').repl.open()
      end, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
    })
  end
}

