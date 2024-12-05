require("luasnip").config.setup({ enable_autosnippets = true, store_selection_keys = "<Tab>" })
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
cmp.setup({
	autoEnableSources = true,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	experimental = { ghost_text = true },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = require("lspkind").cmp_format({
			ellipsis_char = "...",
			maxwidth = 50,
			symbol_map = { Copilot = "" },
		}),
	},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
	},
	performance = { debounce = 60, fetchingTimeout = 200, maxViewEntries = 30 },
	sources = {
		{ name = "nvim_lsp" },
		{ keywordLength = 3, name = "buffer", option = { get_bufnrs = vim.api.nvim_list_bufs } },
		{ name = "cmdline" },
		{ name = "path" },
		{ keywordLength = 3, name = "luasnip" },
	},
	window = { completion = { border = "solid" }, documentation = { border = "solid" } },
})
