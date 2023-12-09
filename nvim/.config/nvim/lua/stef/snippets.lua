local success, ls = pcall(require, "luasnip")
if not success then return end
local snippet = ls.snippet
local snippetNode = ls.snippet_node
local insert = ls.insert_node
local indentSnippetNode = ls.indent_snippet_node
local text = ls.text_node
local dynamic = ls.dynamic_node
local choice = ls.choice_node
local restore = ls.restore_node
local func = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

--[[
--#Snippets
--]]
---#Typescript
local ts_function_fmt = [[
{doc}
{async}{name}({params}): {ret} {{
	{body}
}}
]]
local ts_function_snippet = function()
	return fmt(ts_function_fmt, {
		doc = indentSnippetNode(1, {
			text({ "/**", " " }),
			insert(1, ""),
			choice(2, {
				snippetNode(nil, {
					text({ "", " @returns " }),
					insert(1, ""),
				}),
				text(""),
			}),
			text({ "", "/" }),
		}, "$PARENT_INDENT *"),
		async = choice(2, { text(""), text("async ") }),
		name = insert(3, "funcName"),
		params = insert(4),
		ret = dynamic(5, function(args)
			local async = string.match(args[1][1], "async")
			if async == nil then
				return snippetNode(nil, {
					restore(1, "return_type", insert(nil, "void")),
				})
			end
			return snippetNode(nil, {
				text("Promise<"),
				restore(1, "return_type", insert(nil, "void")),
				text(">"),
			})
		end, { 2 }),
		body = insert(0),
	}, {
		stored = {
			["return_type"] = insert(nil, "void"),
		},
	})
end

local ts_loop_fmt = [[
.{type}({async}({item}) => {{
	{body}
}})
]]
local ts_loop_snippet = function(type)
	return fmt(ts_loop_fmt, {
		type = text(type),
		async = choice(1, { text(""), text("async ") }),
		item = choice(2, { insert(1, "item"), snippetNode(nil, { text("{ "), insert(1, "field"), text(" }") }) }),
		body = insert(0),
	})
end

return {
	typescript = {
		-- methods
		snippet("func", ts_function_snippet()),
		-- array methods
		snippet({ trig = ".map", wordTrig = false }, ts_loop_snippet("map")),
		snippet({ trig = ".filter", wordTrig = false }, ts_loop_snippet("filter")),
		snippet({ trig = ".forEach", wordTrig = false }, ts_loop_snippet("forEach")),
		snippet({ trig = ".find", wordTrig = false }, ts_loop_snippet("find")),
		snippet({ trig = ".some", wordTrig = false }, ts_loop_snippet("some")),
		snippet({ trig = ".every", wordTrig = false }, ts_loop_snippet("every")),
		-- block comments
		snippet(
			{ trig = "/**", snippetType = "autosnippet" },
			fmt(
				[[
/**
 * {comment}
 */
        ]],
				{
					comment = indentSnippetNode(0, {
						insert(1),
					}, "$PARENT_INDENT *"),
				}
			)
		),
	},
}
