vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*",
  command = [[if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
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
