return {
	{
		"laytan/cloak.nvim",
		opts = {
			enabled = true,
			cloak_character = '*',
			-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
			highlight_group = 'Comment',
			-- Applies the length of the replacement characters for all matched
			-- patterns, defaults to the length of the matched pattern.
			-- cloak_length = 3, -- Provide a number if you want to hide the true length of the value.
			-- Whether it should try every pattern to find the best fit or stop after the first.
			try_all_patterns = true,
			-- Re-enable cloak when a matched buffer leaves the window.
			cloak_on_leave = false,
			patterns = {
				{
					-- Match any file starting with '.env'.
					-- This can be a table to match multiple file patterns.
					file_pattern = { '.env*' },
					-- Match an equals sign and any character after it.
					-- This can also be a table of patterns to cloak,
					-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
					cloak_pattern = { '=.+' },
					-- A function, table or string to generate the replacement.
					-- The actual replacement will contain the 'cloak_character'
					-- where it doesn't cover the original text.
					-- If left empty the legacy behavior of keeping the first character is retained.
					replace = nil,
				},
				{
					file_pattern = { '.zsh_secrets' },
					cloak_pattern = { '=.+' },
					replace = nil,
				},

				{
					file_pattern = { '.npmrc*' },
					cloak_pattern = { '(password)=.+' },
					replace = "%1"
				},

				{
					file_pattern = { 'settings*.xml' },
					cloak_pattern = { '(<password>).+', '(<vroKeyPass>).+' },
					replace = "%1",
				},
				{
					file_pattern = { 'env-properties.json', '*state.json' },
					cloak_pattern = { '([pP]assword":).+' },
					replace = "%1",
				},
			},
		},
	}
}
