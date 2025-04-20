local helpers = {}

helpers.bordered = function(opts)
	opts = opts or {}
	return {
		border = opts.border or 'rounded',
		winhighlight = opts.winhighlight or 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
		zindex = opts.zindex or 1001,
		side_padding = opts.side_padding or 1,
		max_width = opts.max_width or nil,
		max_height = opts.max_height or nil,
		-- scrolloff = opts.scrolloff or 0,
		-- col_offset = opts.col_offset or 0,
		-- scrollbar = opts.scrollbar == nil and true or opts.scrollbar,
	}
end

return helpers
