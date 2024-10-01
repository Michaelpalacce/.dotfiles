return {
	-- RUN :UpdateRemotePlugins
	-- Dependencies: pip3 install python-dotenv requests pynvim prompt-toolkit
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'zbirenbaum/copilot.lua'
		},
		event = "VeryLazy",
		opts = {
			mode = "split", -- newbuffer or split  , default: newbuffer
			prompts = {
				-- Code related prompts
				Explain = "Please explain how the following code works.",
				Review = "Please review the following code and provide suggestions for improvement.",
				Tests = "Please explain how the selected code works briefly, then generate unit tests for it.",
				Refactor = "Please refactor the following code to improve its clarity and readability.",
				Documentation =
				"Please add documentation to the following code adhering to the standard for the language. Please keep it short and to the point so it's easier to read. Remember to only add information that is not apparent form the method signature.",
				Simplify = "Please simplify the following code to make it easier to understand.",

				-- Text related prompts
				Summarize = "Please summarize the following text.",
				Spelling = "Please correct any grammar and spelling errors in the following text.",
				Wording = "Please improve the grammar and wording of the following text.",
				Concise = "Please rewrite the following text to make it more concise.",
			}
		},
		keys = {
			-- Code related keys (default: <leader>cc)
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>",       desc = "[C]opilotChat: [C]ode [E]xplain" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>",         desc = "[C]opilotChat: [C]ode Generate [T]ests" },
			{ "<leader>ccr", "<cmd>CopilotChatReview<cr>",        desc = "[C]opilotChat: [C]ode [R]eview" },
			{ "<leader>ccR", "<cmd>CopilotChatRefactor<cr>",      desc = "[C]opilotChat: [C]ode [R]efactor" },
			{ "<leader>ccd", "<cmd>CopilotChatDocumentation<cr>", desc = "[C]opilotChat: [C]ode Add [D]ocumentation" },
			{ "<leader>ccs", "<cmd>CopilotChatSimplify<cr>",      desc = "[C]opilotChat: [C]ode [S]implify" },
			{
				"<leader>cci",
				function()
					local input = vim.fn.input("Ask Copilot: ")
					if input ~= "" then
						vim.cmd("CopilotChat " .. input)
					end
				end,
				desc = "[C]opilot[C]hat: Ask [I]nput",
			},

			-- Text related keys (default: <leader>ct)
			{ "<leader>cts", "<cmd>CopilotChatSummarize<cr>", desc = "[C]opilotChat: [T]ext [S]ummarize" },
			{ "<leader>ctS", "<cmd>CopilotChatSpelling<cr>",  desc = "[C]opilotChat: [T]ext Correct [S]pelling" },
			{ "<leader>ctw", "<cmd>CopilotChatWording<cr>",   desc = "[C]opilotChat: [T]ext Improve [W]ording" },
			{ "<leader>ctc", "<cmd>CopilotChatConcise<cr>",   desc = "[C]opilotChat: [T]ext Make text [C]oncise" },
		}
	},
	{
		'zbirenbaum/copilot.lua',
		cmd = "Copilot",
		event = "VeryLazy",
		opts = {
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "cr",
					open = "<M-CR>"
				},
				layout = {
					position = "top", -- | top | left | right
					ratio = 0.3
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<M-a>",
					accept_word = "<M-Right>",
					accept_line = "<M-Left>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				["*"] = true
			},
			copilot_node_command = 'node', -- Node.js version must be > 18.x
		},
		config = true
	}
}
