local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua"
})

lsp.on_attach(function(client, buffer)
	local options = { buffer = buffer, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, options)
	vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, options)
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, options)
	vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, options)
	vim.keymap.set("n", "<S- >", function() vim.cmd("LspZeroFormat") end, options)
	vim.keymap.set("i", "<S- >", function() vim.cmd("LspZeroFormat") end, options)
end)

lsp.setup()
