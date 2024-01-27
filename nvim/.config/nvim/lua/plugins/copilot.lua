return {
	-- RUN :UpdateRemotePlugins
	-- Dependencies: pip3 install python-dotenv requests pynvim prompt-toolkit
	{
		"jellydn/CopilotChat.nvim",
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
		build = function()
			vim.defer_fn(function()
				vim.cmd("UpdateRemotePlugins")
				vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
			end, 3000)
		end,
		event = "TextYankPost",
		keys = {
			-- Code related keys (default: <leader>cc)
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>",       desc = "[C]opilotChat: [C]ode [E]xplain" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>",         desc = "[C]opilotChat: [C]ode Generate [T]ests" },
			{ "<leader>ccr", "<cmd>CopilotChatReview<cr>",        desc = "[C]opilotChat: [C]ode [R]eview" },
			{ "<leader>ccR", "<cmd>CopilotChatRefactor<cr>",      desc = "[C]opilotChat: [C]ode [R]efactor" },
			{ "<leader>ccd", "<cmd>CopilotChatDocumentation<cr>", desc = "[C]opilotChat: [C]ode Add [D]ocumentation" },
			{ "<leader>ccs", "<cmd>CopilotChatSimplify<cr>",      desc = "[C]opilotChat: [C]ode [S]implify" },

			-- Text related keys (default: <leader>ct)
			{ "<leader>cts", "<cmd>CopilotChatSummarize<cr>",     desc = "[C]opilotChat: [T]ext [S]ummarize" },
			{ "<leader>ctS", "<cmd>CopilotChatSpelling<cr>",      desc = "[C]opilotChat: [T]ext Correct [S]pelling" },
			{ "<leader>ctw", "<cmd>CopilotChatWording<cr>",       desc = "[C]opilotChat: [T]ext Improve [W]ording" },
			{ "<leader>ctc", "<cmd>CopilotChatConcise<cr>",       desc = "[C]opilotChat: [T]ext Make text [C]oncise" },
		},
	},
	{
		'github/copilot.vim',
		event = "BufRead",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
		end
	},
}
