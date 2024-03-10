return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				yaml = { "yamlfmt" },
				lua = { "stylua" },
				python = { "autopep8" },
				htmldjango = { "djlint" },
				html = { "djlint" },
				go = { "gopfumpt", "golines" },
				sql = { "sql_formatter" },
				sh = { "beautysh" },
			},
			format_on_save = true,
			async = false,
			timeout_ms = 500,
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in vitual mode)" })
	end,
}
