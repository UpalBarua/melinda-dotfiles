-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
