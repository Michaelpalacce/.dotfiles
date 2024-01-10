return {
	-- RUN :UpdateRemotePlugins
	-- Dependencies: pip3 install python-dotenv requests pynvim prompt-toolkit
	{ 'gptlang/CopilotChat.nvim' },
	{
		'github/copilot.vim',
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
		end
	},
}
