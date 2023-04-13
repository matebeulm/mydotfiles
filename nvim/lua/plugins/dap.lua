return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {"<leader>dc", function() require("dap").continue() end, desc = "dap continue"},
            {"<leader>db", function() require("dap").toggle_breakpoint() end, desc = "dap toggle breakpoint"},
            {"<leader>dn", function() require("dap").step_over() end, desc = "dap step over"},
        },
        config = function ()
            local dap = require('dap')
            local dap = require('dap')
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    -- CHANGE THIS to your path!
                    command = 'codelldb',
                    args = {"--port", "${port}"},

                    -- On windows you may have to uncomment this:
                    -- detached = false,
                }
            }
            -- dap.adapters.lldb = {
            --     type = 'executable',
            --     command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
            --     name = 'lldb'
            -- }
            -- dap.configurations.cpp = {
            --     {
            --         name = 'Launch',
            --         type = 'lldb',
            --         request = 'launch',
            --         program = function()
            --             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            --         end,
            --         cwd = '${workspaceFolder}',
            --         stopOnEntry = false,
            --         args = {},
            --
            --         -- 💀
            --         -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --         --
            --         --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --         --
            --         -- Otherwise you might get the following error:
            --         --
            --         --    Error on launch: Failed to attach to the target process
            --         --
            --         -- But you should be aware of the implications:
            --         -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            --         -- runInTerminal = false,
            --     },
            -- }
            --
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
            -- -- If you want to use this for Rust and C, add something like this:

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end
        },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {{"mfussenegger/nvim-dap"}},
            keys = {
                {"<leader>dh", function() require("dapui").eval() end, desc = "dapui hover"},
                {"<leader>du", function() require("dapui").toggle() end, desc = "dapui toggle"},
            },
            config = function ()
                local dap, dapui = require("dap"), require("dapui")
                dapui.setup({})
                -- dap.listeners.after.event_initialized["dapui_config"] = function()
                --     dapui.open()
                -- end
                -- dap.listeners.before.event_terminated["dapui_config"] = function()
                --     dapui.close()
                -- end
                -- dap.listeners.before.event_exited["dapui_config"] = function()
                --     dapui.close()
                -- end
            end
        },
        {"theHamsta/nvim-dap-virtual-text"},
        {"nvim-telescope/telescope-dap.nvim"},
    }
