return {
	-- @NOTE: This requires you to have an env variable: GEMINI_API_KEY. I usually set those in .zsh_secrets or .zprofile
	{
		'kiddos/gemini.nvim',
		opts = {
			completion = {
				enabled = false
			},
			instruction = {
				menu_key = '<leader>Ai'
			}
		},
	}
}
