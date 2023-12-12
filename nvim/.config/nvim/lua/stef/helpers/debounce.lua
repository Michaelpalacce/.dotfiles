local debounce = function(func, timeout)
	local timer_id
	return function(...)
		if timer_id ~= nil then
			vim.fn.timer_stop(timer_id)
		end
		local args = { ... }
		timer_id = vim.fn.timer_start(timeout, function()
			func(unpack(args))
		end)
	end
end

return debounce
