local conf = require("telescope.config").values
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"

local flatten = vim.tbl_flatten

-- i would like to be able to do telescope
-- and have telescope do some filtering on files and some grepping

return function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
	opts.shortcuts = opts.shortcuts
		or {
			["l"] = "*.lua",
			["v"] = "*.vim",
			["n"] = "*.{vim,lua}",
			["c"] = "*.c",
			["r"] = "*.rs",
			["g"] = "*.go",
			["y"] = "*.{yaml,yml}",
			["j"] = "*.{json,js}",
			["J"] = "*.{java}",
			["p"] = "*.{py,pyc}",
			["s"] = "*.{sh,zsh}",
			["t"] = "*.ts",
			["h"] = "*.{html,htm}",
			["x"] = "*.{xml,xaml}",
			["m"] = "*.{md,markdown}",
			["a"] = "*",
		}
	opts.pattern = opts.pattern or "%s"

	local custom_grep = finders.new_async_job {
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local prompt_split = vim.split(prompt, "  ")

			local args = { "rg" }
			if prompt_split[1] then
				table.insert(args, "-e")
				table.insert(args, prompt_split[1])
			end

			-- Any other prompts are treated as globs
			for i = 2, #prompt_split do
				table.insert(args, "-g")

				local pattern
				if opts.shortcuts[prompt_split[i]] then
					pattern = opts.shortcuts[prompt_split[i]]
				else
					pattern = prompt_split[i]
				end

				table.insert(args, string.format(opts.pattern, pattern))
			end

			return flatten {
				args,
				{
					'--hidden',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'--glob=!.git',
				},
			}
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	}

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = "Live Grep (with shortcuts and git ignored files)",
			finder = custom_grep,
			previewer = conf.grep_previewer(opts),
			sorter = require("telescope.sorters").empty(),
		})
		:find()
end
