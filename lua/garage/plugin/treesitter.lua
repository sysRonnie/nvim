local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"go",
		"templ",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"bash",
		"lua",
		"markdown",
		"yaml",
		"dockerfile",
		"gitignore",
	},
	auto_install = true,
})
