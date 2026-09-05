vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt", "gitcommit", "tex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.list = false               -- 'linebreak' is ignored while 'list' is on
    vim.opt_local.linebreak = true           -- wrap at spaces, not mid-word
    vim.opt_local.breakindent = true
    vim.opt_local.breakindentopt = "shift:2" -- hanging indent for zero-indent prose
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.conceallevel = 1
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.json",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*",
  command = [[if line("'\"") > 2 && line("'\"") <= line("$") | silent exe "normal! g`\"" | endif]]
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*.md",
  command = "setlocal wrap spell"
})
vim.api.nvim_create_autocmd({ "CmdlineEnter", }, {
  pattern = "/",
  command = "set hlsearch"
})
vim.api.nvim_create_autocmd({ "CmdlineLeave", }, {
  pattern = "/",
  command = "set nohlsearch"
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.nu",
  command = [[set syntax=python]]
})
