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
{type} {async}{name}({params}): {ret} {{
	{body}
}}
]]
local ts_function_snippet = function(type)
	return fmt(ts_function_fmt, {
		doc = indentSnippetNode(5, {
			text({ "/**", " " }),
			insert(1, ""),
			rep(2, text(" ")),
			text({ "", "/" }),
		}, "$PARENT_INDENT *"),
		type = text(type),
		async = choice(1, { text(""), text("async ") }),
		name = insert(2, "funcName"),
		params = insert(3),
		ret = dynamic(4, function(args)
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
		end, { 1 }),
		body = insert(0),
	}, {
		stored = {
			["return_type"] = insert(nil, "void"),
		},
	})
end

return {
	go = {
		snippet(
			{
				trig = "main",
			},
			fmt(
				[[
func main() {{
	{}
}}
			]],
				{
					insert(1, "// Logic"),
				}
			)
		),
		snippet("print", fmt(
			[[fmt.Println({print})]],
			{
				print = insert(0)
			}
		)),

		snippet("printf", fmt(
			[[fmt.Printf("%s", {var})]],
			{
				var = insert(0)
			}
		)),

		snippet("errf", fmt(
			[[fmt.Errorf("Err: %w", err)]],
			{}
		)),
		snippet(
			{
				trig = "errnil",
			},
			fmt(
				[[
if err != nil {{
	{}
}}
			]],
				{
					insert(1, "// handle error"),
				}
			)
		),
		-- funcs
		snippet("func", fmt(
			[[func {name}({params}) {ret} {{
	{body}
}}
			]],
			{
				name = insert(1, "funcName"),
				params = insert(2),
				ret = insert(3),
				body = insert(0),
			}
		)),
	},
	javascript = {
		-- methods
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
	typescript = {
		-- methods
		snippet("public", ts_function_snippet("public")),
		snippet("private", ts_function_snippet("private")),
		snippet("func", ts_function_snippet("function")),
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
