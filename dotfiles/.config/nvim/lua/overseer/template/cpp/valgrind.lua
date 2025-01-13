return {
  name = "valgrind check",
  builder = function()
    local filepath = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    local output = vim.fn.fnamemodify(filepath, ":r") .. ".txt"
    return {
      cmd = { "valgrind" },
      args = { "--leak-check=full",
        "--show-leak-kinds=all",
        "--track-origins=yes",
        "--log-file=" .. output,
        filepath
      },
    }
  end,
  condition = {
    filetype = { "cpp", "c", "cmake" },
  },
}
