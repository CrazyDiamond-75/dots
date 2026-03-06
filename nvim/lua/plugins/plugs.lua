return {
	"sainnhe/gruvbox-material",
	{ "ms-jpq/coq_nvim", branch = "coq" },
	{ "ms-jpq/coq.artifacts", branch = "artifacts" },
	{ "ms-jpq/coq.thirdparty", branch = "3p" },
	"itchyny/lightline.vim",
	"APZelos/blamer.nvim",
	"let-def/texpresso.vim",
	"nvim-treesitter/nvim-treesitter",
	{ "mason-org/mason.nvim", opts = {} },
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					tex = { "tex-fmt" },
					bib = { "tex-fmt" },
					ts = { "prettierd" },
					js = { "prettierd" },
					lua = { "stylua" },
				},
				format_on_save = {},
			})

			conform.formatters["tex-fmt"] = {
				append_args = { "--nowrap", "--tabsize", "4" },
			}

			vim.keymap.set({ "n", "v" }, "<F3>", function()
				conform.format()
			end, { desc = "Format file" })
		end,
	},
}
