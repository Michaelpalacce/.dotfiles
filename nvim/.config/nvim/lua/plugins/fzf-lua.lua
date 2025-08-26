return {
	{
		"ibhagwan/fzf-lua",
		keys = {
			{ "<leader>ff",    mode = { "n" }, function() require("fzf-lua").files() end,        desc = "Fzf-Lua: [F]ind [F]iles" },
			{ '<leader>fF',    mode = { "n" }, function() require("fzf-lua").oldfiles() end,     desc = 'Fzf-Lua: [F]ind Oldfiles' },
			{ '<leader>fr',    mode = { "n" }, function() require("fzf-lua").resume() end,       desc = 'Fzf-Lua: [F]inder [R]esume' },
			{ '<leader>fs',    mode = { "n" }, function() require("fzf-lua").live_grep() end,    desc = 'Fzf-Lua: [F]ind [S]tring' },
			{ '<leader>fh',    mode = { "n" }, function() require("fzf-lua").helptags() end,     desc = 'Fzf-Lua: [F]ind [H]elp Tags' },
			{ '<leader>fg',    mode = { "n" }, function() require("fzf-lua").git_files() end,    desc = 'Fzf-Lua: [F]ind [G]it files' },
			{ '<leader>fc',    mode = { "n" }, function() require("fzf-lua").grep_curbuf() end,  desc = 'Fzf-Lua: [F]ind [C]urrent file' },
			{ '<leader>fq',    mode = { "n" }, function() require("fzf-lua").quickfix() end,     desc = 'Fzf-Lua: [F]ind In The [Q]uickfix List' },
			{ '<leader>fk',    mode = { "n" }, function() require("fzf-lua").keymaps() end,      desc = 'Fzf-Lua: [F]ind [K]eymaps' },
			{ '<leader>fo',    mode = { "n" }, function() require("fzf-lua").nvim_options() end, desc = 'Fzf-Lua: [F]ind Vim [O]ptions' },
			{ '<leader>fR',    mode = { "n" }, function() require("fzf-lua").registers() end,    desc = 'Fzf-Lua: [F]ind in [R^]egsiters' },
			{ '<leader>fb',    mode = { "n" }, function() require("fzf-lua").buffers() end,      desc = 'Fzf-Lua: [F]ind [B]uffers' },
			{ "<Leader><tab>", mode = { "n" }, function() require("fzf-lua").commands() end,     desc = "Fzf-Lua: Commands",                     noremap = false },
		},
		init = function()
			vim.api.nvim_create_autocmd("VimResized", {
				pattern = '*',
				command = 'lua require("fzf-lua").redraw()'
			})
		end,
		-- build = function()
		-- 	vim.fn.system("git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf")
		-- 	vim.fn.system("~/.fzf/install --completion --key-bindings --no-update-rc")
		-- 	vim.fn.system("sudo ln -sf $HOME/.fzf/bin/fzf /usr/local/bin/fzf")
		-- end,
		config = function()
			local actions = require('fzf-lua').actions

			require('fzf-lua').setup {
				"telescope",
				-- MISC GLOBAL SETUP OPTIONS, SEE BELOW
				-- fzf_bin = ...,
				-- each of these options can also be passed as function that return options table
				-- e.g. winopts = function() return { ... } end
				fzf_opts = {
					['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history',
				},
				winopts = {
					-- split = "belowright new",-- open in a split instead?
					-- "belowright new"  : split below
					-- "aboveleft new"   : split above
					-- "belowright vnew" : split right
					-- "aboveleft vnew   : split left
					-- Only valid when using a float window
					-- (i.e. when 'split' is not defined, default)
					height     = 0.85, -- window height
					width      = 0.95, -- window width
					row        = 0.35, -- window row position (0=top, 1=bottom)
					col        = 0.50, -- window col position (0=left, 1=right)
					-- border argument passthrough to nvim_open_win()
					border     = "rounded",
					-- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
					backdrop   = 60,
					-- title         = "Title",
					-- title_pos     = "center",        -- 'left', 'center' or 'right'
					-- title_flags   = false,           -- uncomment to disable title flags
					fullscreen = false, -- start fullscreen?
					-- enable treesitter highlighting for the main fzf window will only have
					-- effect where grep like results are present, i.e. "file:line:col:text"
					-- due to highlight color collisions will also override `fzf_colors`
					-- set `fzf_colors=false` or `fzf_colors.hl=...` to override
					treesitter = {
						enabled    = true,
						fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
					},
					on_create  = function()
						-- called once upon creation of the fzf main window
						-- can be used to add custom fzf-lua mappings, e.g:
						--   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
					end,
				},
				actions = {
					files = {
						-- true,        -- uncomment to inherit all the below in your custom config
						-- Pickers inheriting these actions:
						--   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
						--   tags, btags, args, buffers, tabs, lines, blines
						-- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
						-- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
						-- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
						["enter"]  = actions.file_edit_or_qf,
						["ctrl-s"] = actions.file_split,
						["ctrl-v"] = actions.file_vsplit,
						["ctrl-t"] = actions.file_tabedit,
						["alt-q"]  = actions.file_sel_to_qf,
						["alt-Q"]  = actions.file_sel_to_ll,
						["alt-i"]  = actions.toggle_ignore,
						["alt-h"]  = actions.toggle_hidden,
						["alt-f"]  = actions.toggle_follow,
					},
				},
				keymap = {
					builtin = {
						-- neovim `:tmap` mappings for the fzf win
						-- true,        -- uncomment to inherit all the below in your custom config
						["<M-Esc>"]    = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
						["<F1>"]       = "toggle-help",
						["<F2>"]       = "toggle-fullscreen",
						-- Only valid with the 'builtin' previewer
						["<F3>"]       = "toggle-preview-wrap",
						["<F4>"]       = "toggle-preview",
						-- Rotate preview clockwise/counter-clockwise
						["<F5>"]       = "toggle-preview-ccw",
						["<F6>"]       = "toggle-preview-cw",
						-- `ts-ctx` binds require `nvim-treesitter-context`
						["<F7>"]       = "toggle-preview-ts-ctx",
						["<F8>"]       = "preview-ts-ctx-dec",
						["<F9>"]       = "preview-ts-ctx-inc",
						["<S-Left>"]   = "preview-reset",
						["<S-down>"]   = "preview-page-down",
						["<S-up>"]     = "preview-page-up",
						["<M-S-down>"] = "preview-down",
						["<M-S-up>"]   = "preview-up",
					},
					fzf = {
						-- fzf '--bind=' options
						["ctrl-z"]     = "abort",
						["ctrl-u"]     = "unix-line-discard",
						["ctrl-f"]     = "half-page-down",
						["ctrl-b"]     = "half-page-up",
						["ctrl-a"]     = "beginning-of-line",
						["ctrl-e"]     = "end-of-line",
						["ctrl-q"]     = "select-all+accept",
						["alt-a"]      = "toggle-all",
						["alt-g"]      = "first",
						["alt-G"]      = "last",
						-- Only valid with fzf previewers (bat/cat/git/etc)
						["f3"]         = "toggle-preview-wrap",
						["f4"]         = "toggle-preview",
						["shift-down"] = "preview-page-down",
						["shift-up"]   = "preview-page-up",
					},
				}, -- Neovim keymaps / fzf binds
				files = {
					-- previewer      = "bat",          -- uncomment to override previewer
					-- (name from 'previewers' table)
					-- set to 'false' to disable
					prompt                 = 'Files❯ ',
					multiprocess           = true, -- run command in a separate process
					git_icons              = true, -- show git icons?
					file_icons             = true, -- show file icons (true|"devicons"|"mini")?
					color_icons            = true, -- colorize file|git icons
					-- path_shorten   = 1,              -- 'true' or number, shorten path?
					-- Uncomment for custom vscode-like formatter where the filename is first:
					-- e.g. "fzf-lua/previewer/fzf.lua" => "fzf.lua previewer/fzf-lua"
					-- formatter      = "path.filename_first",
					-- executed command priority is 'cmd' (if exists)
					-- otherwise auto-detect prioritizes `fd`:`rg`:`find`
					-- default options are controlled by 'fd|rg|find|_opts'
					-- cmd            = "rg --files",
					find_opts              = [[-type f \! -path '*/.git/*']],
					rg_opts                = [[--color=never --hidden --files -g "!.git"]],
					fd_opts                = [[--color=never --hidden --type f --type l --exclude .git]],
					dir_opts               = [[/s/b/a:-d]],
					-- by default, cwd appears in the header only if {opts} contain a cwd
					-- parameter to a different folder than the current working directory
					-- uncomment if you wish to force display of the cwd as part of the
					-- query prompt string (fzf.vim style), header line or both
					cwd_header             = true,
					cwd_prompt             = true,
					cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
					cwd_prompt_shorten_val = 1, -- shortened path parts length
					toggle_ignore_flag     = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
					toggle_hidden_flag     = "--hidden", -- flag toggled in `actions.toggle_hidden`
					toggle_follow_flag     = "-L", -- flag toggled in `actions.toggle_follow`
					hidden                 = true, -- enable hidden files by default
					follow                 = false, -- do not follow symlinks by default
					no_ignore              = false, -- respect ".gitignore"  by default
					actions                = {
						-- inherits from 'actions.files', here we can override
						-- or set bind to 'false' to disable a default action
						-- uncomment to override `actions.file_edit_or_qf`
						--   ["enter"]     = actions.file_edit,
						-- custom actions are available too
						--   ["ctrl-y"]    = function(selected) print(selected[1]) end,
					}
				},
				git = {
					files = {
						prompt       = 'GitFiles❯ ',
						cmd          = 'git ls-files --exclude-standard',
						multiprocess = true, -- run command in a separate process
						git_icons    = true, -- show git icons?
						file_icons   = true, -- show file icons (true|"devicons"|"mini")?
						color_icons  = true, -- colorize file|git icons
						-- force display the cwd header line regardless of your current working
						-- directory can also be used to hide the header when not wanted
						-- cwd_header = true
					},
					status = {
						prompt       = 'GitStatus❯ ',
						cmd          = "git -c color.status=false --no-optional-locks status --porcelain=v1 -u",
						multiprocess = true, -- run command in a separate process
						file_icons   = true,
						color_icons  = true,
						previewer    = "git_diff",
						-- git-delta is automatically detected as pager, uncomment to disable
						-- preview_pager = false,
						actions      = {
							-- actions inherit from 'actions.files' and merge
							["right"]  = { fn = actions.git_unstage, reload = true },
							["left"]   = { fn = actions.git_stage, reload = true },
							["ctrl-x"] = { fn = actions.git_reset, reload = true },
						},
						-- If you wish to use a single stage|unstage toggle instead
						-- using 'ctrl-s' modify the 'actions' table as shown below
						-- actions = {
						--   ["right"]   = false,
						--   ["left"]    = false,
						--   ["ctrl-x"]  = { fn = actions.git_reset, reload = true },
						--   ["ctrl-s"]  = { fn = actions.git_stage_unstage, reload = true },
						-- },
					},
					commits = {
						prompt  = 'Commits❯ ',
						cmd     = [[git log --color --pretty=format:"%C(yellow)%h%Creset ]]
							.. [[%Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset"]],
						preview = "git show --color {1}",
						-- git-delta is automatically detected as pager, uncomment to disable
						-- preview_pager = false,
						actions = {
							["enter"]  = actions.git_checkout,
							-- remove `exec_silent` or set to `false` to exit after yank
							["ctrl-y"] = { fn = actions.git_yank_commit, exec_silent = true },
						},
					},
					bcommits = {
						prompt  = 'BCommits❯ ',
						-- default preview shows a git diff vs the previous commit
						-- if you prefer to see the entire commit you can use:
						--   git show --color {1} --rotate-to={file}
						--   {1}    : commit SHA (fzf field index expression)
						--   {file} : filepath placement within the commands
						cmd     = [[git log --color --pretty=format:"%C(yellow)%h%Creset ]]
							.. [[%Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset" {file}]],
						preview = "git show --color {1} -- {file}",
						-- git-delta is automatically detected as pager, uncomment to disable
						-- preview_pager = false,
						actions = {
							["enter"]  = actions.git_buf_edit,
							["ctrl-s"] = actions.git_buf_split,
							["ctrl-v"] = actions.git_buf_vsplit,
							["ctrl-t"] = actions.git_buf_tabedit,
							["ctrl-y"] = { fn = actions.git_yank_commit, exec_silent = true },
						},
					},
					branches = {
						prompt  = 'Branches❯ ',
						cmd     = "git branch --all --no-color",
						preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
						remotes = "local", -- "detach|local", switch behavior for remotes
						actions = {
							["enter"]  = actions.git_switch,
							["ctrl-x"] = { fn = actions.git_branch_del, reload = true },
							["ctrl-a"] = { fn = actions.git_branch_add, field_index = "{q}", reload = true },
						},
						-- If you wish to add branch and switch immediately
						cmd_add = { "git", "checkout", "-b" },
						-- If you wish to delete unmerged branches add "--force"
						-- cmd_del  = { "git", "branch", "--delete", "--force" },
						cmd_del = { "git", "branch", "--delete" },
					},
					tags = {
						prompt  = "Tags> ",
						cmd     = [[git for-each-ref --color --sort="-taggerdate" --format ]]
							.. [["%(color:yellow)%(refname:short)%(color:reset) ]]
							.. [[%(color:green)(%(taggerdate:relative))%(color:reset)]]
							.. [[ %(subject) %(color:blue)%(taggername)%(color:reset)" refs/tags]],
						preview = [[git log --graph --color --pretty=format:"%C(yellow)%h%Creset ]]
							.. [[%Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset" {1}]],
						actions = { ["enter"] = actions.git_checkout },
					},
					stash = {
						prompt  = 'Stash> ',
						cmd     = "git --no-pager stash list",
						preview = "git --no-pager stash show --patch --color {1}",
						actions = {
							["enter"]  = actions.git_stash_apply,
							["ctrl-x"] = { fn = actions.git_stash_drop, reload = true },
						},
					},
					icons = {
						["M"] = { icon = "★", color = "red" },
						["D"] = { icon = "✗", color = "red" },
						["A"] = { icon = "+", color = "green" },
						-- ["M"] = { icon = "M", color = "yellow" },
						-- ["D"] = { icon = "D", color = "red" },
						-- ["A"] = { icon = "A", color = "green" },
						["R"] = { icon = "R", color = "yellow" },
						["C"] = { icon = "C", color = "yellow" },
						["T"] = { icon = "T", color = "magenta" },
						["?"] = { icon = "?", color = "magenta" },
					},
				},
				grep = {
					prompt           = 'Rg❯ ',
					input_prompt     = 'Grep For❯ ',
					multiprocess     = true, -- run command in a separate process
					git_icons        = true, -- show git icons?
					file_icons       = true, -- show file icons (true|"devicons"|"mini")?
					color_icons      = true, -- colorize file|git icons
					-- executed command priority is 'cmd' (if exists)
					-- otherwise auto-detect prioritizes `rg` over `grep`
					-- default options are controlled by 'rg|grep_opts'
					-- cmd            = "rg --vimgrep",
					grep_opts        = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
					-- You can filter out files like: `query --glob *.yaml` or the like. You can also use live grep :) ctrl-g
					rg_opts          = "--sort-files --column --line-number --no-heading --with-filename " .. -- if having problesms with performance, remove `--sort-files
						"--color=never --smart-case --max-columns=4096 -g !.git -e",
					hidden           = true,                                                   -- disable hidden files by default
					follow           = false,                                                  -- do not follow symlinks by default
					no_ignore        = false,                                                  -- respect ".gitignore"  by default
					exec_empty_query = true,
					-- Uncomment to use the rg config file `$RIPGREP_CONFIG_PATH`
					-- RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH
					--
					-- Set to 'true' to always parse globs in both 'grep' and 'live_grep'
					-- search strings will be split using the 'glob_separator' and translated
					-- to '--iglob=' arguments, requires 'rg'
					-- can still be used when 'false' by calling 'live_grep_glob' directly
					rg_glob          = true, -- default to glob parsing with `rg`
					glob_flag        = "--iglob", -- for case sensitive globs use '--glob'
					glob_separator   = "%s%-%-", -- query separator pattern (lua): ' --'
					-- advanced usage: for custom argument parsing define
					-- 'rg_glob_fn' to return a pair:
					--   first returned argument is the new search query
					--   second returned argument are additional rg flags
					-- rg_glob_fn = function(query, opts)
					--   ...
					--   return new_query, flags
					-- end,
					--
					-- Enable with narrow term width, split results to multiple lines
					-- NOTE: multiline requires fzf >= v0.53 and is ignored otherwise
					-- multiline      = 1,      -- Display as: PATH:LINE:COL\nTEXT
					-- multiline      = 2,      -- Display as: PATH:LINE:COL\nTEXT\n
					actions          = {
						-- actions inherit from 'actions.files' and merge
						-- this action toggles between 'grep' and 'live_grep'
						["ctrl-g"] = { actions.grep_lgrep }
						-- uncomment to enable '.gitignore' toggle for grep
						-- ["ctrl-r"]   = { actions.toggle_ignore }
					},
					no_header        = false, -- hide grep|cwd header?
					no_header_i      = false, -- hide interactive header?
				},
				args = {
					prompt     = 'Args❯ ',
					files_only = true,
					-- actions inherit from 'actions.files' and merge
					actions    = { ["ctrl-x"] = { fn = actions.arg_del, reload = true } },
				},
				oldfiles = {
					prompt                  = 'History❯ ',
					cwd_only                = false,
					stat_file               = true, -- verify files exist on disk
					-- can also be a lua function, for example:
					-- stat_file = require("fzf-lua").utils.file_is_readable,
					-- stat_file = function() return true end,
					include_current_session = false, -- include bufs from current session
				},
				buffers = {
					prompt        = 'Buffers❯ ',
					file_icons    = true, -- show file icons (true|"devicons"|"mini")?
					color_icons   = true, -- colorize file|git icons
					sort_lastused = true, -- sort buffers() by last used
					show_unloaded = true, -- show unloaded buffers
					cwd_only      = false, -- buffers for the cwd only
					cwd           = nil, -- buffers list for a given dir
					actions       = {
						-- actions inherit from 'actions.files' and merge
						-- by supplying a table of functions we're telling
						-- fzf-lua to not close the fzf window, this way we
						-- can resume the buffers picker on the same window
						-- eliminating an otherwise unaesthetic win "flash"
						["ctrl-x"] = { fn = actions.buf_del, reload = true },
					}
				},
				tabs = {
					prompt      = 'Tabs❯ ',
					tab_title   = "Tab",
					tab_marker  = "<<",
					file_icons  = true, -- show file icons (true|"devicons"|"mini")?
					color_icons = true, -- colorize file|git icons
					actions     = {
						-- actions inherit from 'actions.files' and merge
						["enter"]  = actions.buf_switch,
						["ctrl-x"] = { fn = actions.buf_del, reload = true },
					},
					fzf_opts    = {
						-- hide tabnr
						["--delimiter"] = "[\\):]",
						["--with-nth"]  = '2..',
					},
				},
				-- `blines` has the same defaults as `lines` aside from prompt and `show_bufname`
				lines = {
					prompt          = 'Lines❯ ',
					file_icons      = true,
					show_bufname    = true,   -- display buffer name
					show_unloaded   = true,   -- show unloaded buffers
					show_unlisted   = false,  -- exclude 'help' buffers
					no_term_buffers = true,   -- exclude 'term' buffers
					sort_lastused   = true,   -- sort by most recent
					winopts         = { treesitter = true }, -- enable TS highlights
					fzf_opts        = {
						-- do not include bufnr in fuzzy matching
						-- tiebreak by line no.
						["--multi"]     = true,
						["--delimiter"] = "[\t]",
						["--tabstop"]   = "1",
						["--tiebreak"]  = "index",
						["--with-nth"]  = "2..",
						["--nth"]       = "4..",
					},
				},
				tags = {
					prompt       = 'Tags❯ ',
					ctags_file   = nil, -- auto-detect from tags-option
					multiprocess = true,
					file_icons   = true,
					color_icons  = true,
					-- 'tags_live_grep' options, `rg` prioritizes over `grep`
					rg_opts      = "--no-heading --color=always --smart-case",
					grep_opts    = "--color=auto --perl-regexp",
					fzf_opts     = { ["--tiebreak"] = "begin" },
					actions      = {
						-- actions inherit from 'actions.files' and merge
						-- this action toggles between 'grep' and 'live_grep'
						["ctrl-g"] = { actions.grep_lgrep }
					},
					no_header    = false, -- hide grep|cwd header?
					no_header_i  = false, -- hide interactive header?
				},
				btags = {
					prompt        = 'BTags❯ ',
					ctags_file    = nil, -- auto-detect from tags-option
					ctags_autogen = true, -- dynamically generate ctags each call
					multiprocess  = true,
					file_icons    = false,
					rg_opts       = "--color=never --no-heading",
					grep_opts     = "--color=never --perl-regexp",
					fzf_opts      = { ["--tiebreak"] = "begin" },
					-- actions inherit from 'actions.files'
				},
				colorschemes = {
					prompt       = 'Colorschemes❯ ',
					live_preview = true, -- apply the colorscheme on preview?
					actions      = { ["enter"] = actions.colorscheme },
					winopts      = { height = 0.55, width = 0.30, },
					-- uncomment to ignore colorschemes names (lua patterns)
					-- ignore_patterns   = { "^delek$", "^blue$" },
				},
				awesome_colorschemes = {
					prompt       = 'Colorschemes❯ ',
					live_preview = true, -- apply the colorscheme on preview?
					max_threads  = 5, -- max download/update threads
					winopts      = { row = 0, col = 0.99, width = 0.50 },
					fzf_opts     = {
						["--multi"]     = true,
						["--delimiter"] = "[:]",
						["--with-nth"]  = "3..",
						["--tiebreak"]  = "index",
					},
					actions      = {
						["enter"]  = actions.colorscheme,
						["ctrl-g"] = { fn = actions.toggle_bg, exec_silent = true },
						["ctrl-r"] = { fn = actions.cs_update, reload = true },
						["ctrl-x"] = { fn = actions.cs_delete, reload = true },
					},
				},
				keymaps = {
					prompt          = "Keymaps> ",
					winopts         = { preview = { layout = "vertical" } },
					fzf_opts        = { ["--tiebreak"] = "index", },
					-- by default, we ignore <Plug> and <SNR> mappings
					-- set `ignore_patterns = false` to disable filtering
					ignore_patterns = { "^<SNR>", "^<Plug>" },
					show_desc       = true,
					show_details    = true,
					actions         = {
						["enter"]  = actions.keymap_apply,
						["ctrl-s"] = actions.keymap_split,
						["ctrl-v"] = actions.keymap_vsplit,
						["ctrl-t"] = actions.keymap_tabedit,
					},
				},
				nvim_options = {
					prompt       = "Nvim Options> ",
					separator    = "│", -- separator between option name and value
					color_values = true, -- colorize boolean values
					actions      = {
						["enter"]     = { fn = actions.nvim_opt_edit_local, reload = true },
						["alt-enter"] = { fn = actions.nvim_opt_edit_global, reload = true },
					},
				},
				quickfix = {
					file_icons = true,
					only_valid = false, -- select among only the valid quickfix entries
				},
				quickfix_stack = {
					prompt = "Quickfix Stack> ",
					marker = ">", -- current list marker
				},
				lsp = {
					prompt_postfix     = '❯ ', -- will be appended to the LSP label
					-- to override use 'prompt' instead
					cwd_only           = false, -- LSP/diagnostics for cwd only?
					async_or_timeout   = 5000, -- timeout(ms) or 'true' for async calls
					file_icons         = true,
					git_icons          = false,
					jump1              = true, -- skip the UI when result is a single entry
					jump1_action       = actions.file_edit,
					-- The equivalent of using `includeDeclaration` in lsp buf calls, e.g:
					-- :lua vim.lsp.buf.references({includeDeclaration = false})
					includeDeclaration = true, -- include current declaration in LSP context
					-- settings for 'lsp_{document|workspace|lsp_live_workspace}_symbols'
					symbols            = {
						-- lsp_query      = "foo"       -- query passed to the LSP directly
						-- query          = "bar"       -- query passed to fzf prompt for fuzzy matching
						async_or_timeout = true, -- symbols are async by default
						symbol_style     = 1, -- style for document/workspace symbols
						-- false: disable,    1: icon+kind
						--     2: icon only,  3: kind only
						-- NOTE: icons are extracted from
						-- vim.lsp.protocol.CompletionItemKind
						-- icons for symbol kind
						-- see https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
						-- see https://github.com/neovim/neovim/blob/829d92eca3d72a701adc6e6aa17ccd9fe2082479/runtime/lua/vim/lsp/protocol.lua#L117
						symbol_icons     = {
							File          = "󰈙",
							Module        = "",
							Namespace     = "󰦮",
							Package       = "",
							Class         = "󰆧",
							Method        = "󰊕",
							Property      = "",
							Field         = "",
							Constructor   = "",
							Enum          = "",
							Interface     = "",
							Function      = "󰊕",
							Variable      = "󰀫",
							Constant      = "󰏿",
							String        = "",
							Number        = "󰎠",
							Boolean       = "󰨙",
							Array         = "󱡠",
							Object        = "",
							Key           = "󰌋",
							Null          = "󰟢",
							EnumMember    = "",
							Struct        = "󰆼",
							Event         = "",
							Operator      = "󰆕",
							TypeParameter = "󰗴",
						},
						-- colorize using Treesitter '@' highlight groups ("@function", etc).
						-- or 'false' to disable highlighting
						symbol_hl        = function(s) return "@" .. s:lower() end,
						-- additional symbol formatting, works with or without style
						symbol_fmt       = function(s, opts) return "[" .. s .. "]" end,
						-- prefix child symbols. set to any string or `false` to disable
						child_prefix     = true,
						fzf_opts         = { ["--tiebreak"] = "begin" },
					},
					code_actions       = {
						prompt           = 'Code Actions> ',
						async_or_timeout = 5000,
						-- when git-delta is installed use "codeaction_native" for beautiful diffs
						-- try it out with `:FzfLua lsp_code_actions previewer=codeaction_native`
						-- scroll up to `previewers.codeaction{_native}` for more previewer options
						previewer        = "codeaction",
					},
					finder             = {
						prompt             = "LSP Finder> ",
						file_icons         = true,
						color_icons        = true,
						async              = true, -- async by default
						silent             = true, -- suppress "not found"
						separator          = "| ", -- separator after provider prefix, `false` to disable
						includeDeclaration = true, -- include current declaration in LSP context
						-- by default display all LSP locations
						-- to customize, duplicate table and delete unwanted providers
						providers          = {
							{ "references",      prefix = require("fzf-lua").utils.ansi_codes.blue("ref ") },
							{ "definitions",     prefix = require("fzf-lua").utils.ansi_codes.green("def ") },
							{ "declarations",    prefix = require("fzf-lua").utils.ansi_codes.magenta("decl") },
							{ "typedefs",        prefix = require("fzf-lua").utils.ansi_codes.red("tdef") },
							{ "implementations", prefix = require("fzf-lua").utils.ansi_codes.green("impl") },
							{ "incoming_calls",  prefix = require("fzf-lua").utils.ansi_codes.cyan("in  ") },
							{ "outgoing_calls",  prefix = require("fzf-lua").utils.ansi_codes.yellow("out ") },
						},
					}
				},
				diagnostics = {
					prompt       = 'Diagnostics❯ ',
					cwd_only     = false,
					file_icons   = true,
					git_icons    = false,
					diag_icons   = true,
					diag_source  = true, -- display diag source (e.g. [pycodestyle])
					icon_padding = '', -- add padding for wide diagnostics signs
					multiline    = true, -- concatenate multi-line diags into a single line
					-- severity_only:   keep any matching exact severity
					-- severity_limit:  keep any equal or more severe (lower)
					-- severity_bound:  keep any equal or less severe (higher)
				},
				marks = {
					marks = "", -- filter vim marks with a lua pattern
					-- for example if you want to only show user defined marks
					-- you would set this option as %a this would match characters from [A-Za-z]
					-- or if you want to show only numbers you would set the pattern to %d (0-9).
				},
				complete_path = {
					cmd          = nil, -- default: auto detect fd|rg|find
					complete     = { ["enter"] = actions.complete },
					word_pattern = nil, -- default: "[^%s\"']*"
				},
				complete_file = {
					cmd          = nil, -- default: auto detect rg|fd|find
					file_icons   = true,
					color_icons  = true,
					word_pattern = nil,
					-- actions inherit from 'actions.files' and merge
					actions      = { ["enter"] = actions.complete },
					-- previewer hidden by default
					winopts      = { preview = { hidden = true } },
				},
				zoxide = {
					cmd       = "zoxide query --list --score",
					git_root  = false, -- auto-detect git root
					formatter = "path.dirname_first",
					fzf_opts  = {
						["--no-multi"]  = true,
						["--delimiter"] = "[\t]",
						["--tabstop"]   = "4",
						["--tiebreak"]  = "end,index", -- prefer dirs ending with search term
						["--nth"]       = "2..", -- exclude score from fuzzy matching
					},
					actions   = { enter = actions.cd }
				},
				-- uncomment to use fzf native previewers
				-- (instead of using a neovim floating window)
				-- manpages = { previewer = "man_native" },
				-- helptags = { previewer = "help_native" },
			}
		end
	},
}
