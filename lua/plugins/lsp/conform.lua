return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				yaml = { "yamlfmt" },
				lua = { "stylua" },
				python = { "autopep8" },
				htmldjango = { "djlint" },
				go = { "goimport_reviser", "gofmt", "golines", "gofumpt" },
				sql = { "sql_formatter" },
			},
			format_on_save = true,
			async = false,
			timeout_ms = 500,
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in vitual mode)" })
	end,
}
