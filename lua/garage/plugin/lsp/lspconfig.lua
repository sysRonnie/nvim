local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then return end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then return end

local saga_status, saga = pcall(require, "lspsaga")
if saga_status then
  saga.setup({
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
    finder_action_keys = { open = "<CR>" },
    definition_action_keys = { edit = "<CR>" },
  })
end

local keymap = vim.keymap
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) 
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf_implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) 
  keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
  end
end

-- Isolated gopls setup
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.templ.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


-- You can now isolate and simplify other LSPs similarly.

