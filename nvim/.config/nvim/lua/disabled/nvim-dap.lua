return {
	-- Debugging capabilities
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'nvim-neotest/nvim-nio',
			'rcarriga/nvim-dap-ui',
			'leoluz/nvim-dap-go',
			'jay-babu/mason-nvim-dap.nvim',
			'theHamsta/nvim-dap-virtual-text'
		},
		-- Limit to go, cause that's all I use it for
		ft = { "go", "gomod" },
		config = function()
			vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "DAP: Continue" })
			vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "DAP: Step Over" })
			vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "DAP: Step Into" })
			vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "DAP: Step Out" })
			vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end,
				{ desc = "DAP: Toggle Breakpoint" })
			vim.keymap.set('n', '<Leader>dL',
				function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
				{ desc = "DAP: Log Point" })
			vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "DAP: Open REPL" })
			vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "DAP: Run Last" })

			vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
				require('dap.ui.widgets').hover()
			end, { desc = "DAP: Hover" })

			vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
				require('dap.ui.widgets').preview()
			end, { desc = "DAP: Preview" })

			vim.keymap.set('n', '<Leader>df', function()
				local widgets = require('dap.ui.widgets')
				widgets.centered_float(widgets.frames)
			end, { desc = "DAP: Frames" })

			vim.keymap.set('n', '<Leader>ds', function()
				local widgets = require('dap.ui.widgets')
				widgets.centered_float(widgets.scopes)
			end, { desc = "DAP: Scopes" })

			vim.keymap.set('n', '<Leader>du', function()
				require('dapui').toggle()
			end, { desc = "DAP-UI: Toggle" })


			require('dapui').setup()
			require('dap-go').setup {
				-- Additional dap configurations can be added.
				-- dap_configurations accepts a list of tables where each entry
				-- represents a dap configuration. For more details do:
				-- :help dap-configuration
				dap_configurations = {
					{
						type = "go",
						name = "Debug All",
						request = "launch",
						program = "${workspaceFolder}/cmd/controller",
						args = {
							"--log-dev",
							"--log-level=info",
							"--log-time-encoder=iso8601",
						},
					}
				},
				-- delve configurations
				delve = {
					-- the path to the executable dlv which will be used for debugging.
					-- by default, this is the "dlv" executable on your PATH.
					path = "dlv",
					-- time to wait for delve to initialize the debug session.
					-- default to 20 seconds
					initialize_timeout_sec = 20,
					-- a string that defines the port to start delve debugger.
					-- default to string "${port}" which instructs nvim-dap
					-- to start the process in a random available port
					port = "${port}",
					-- additional args to pass to dlv
					args = {},
					-- the build flags that are passed to delve.
					-- defaults to empty string, but can be used to provide flags
					-- such as "-tags=unit" to make sure the test suite is
					-- compiled during debugging, for example.
					-- passing build flags using args is ineffective, as those are
					-- ignored by delve in dap mode.
					build_flags = "",
				},
			}
		end
	},
}
