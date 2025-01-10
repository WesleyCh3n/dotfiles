return {
  name = "valgrind check",
  builder = function()
    local filepath = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    return {
      cmd = { "valgrind" },
      args = { "--leak-check=full",
        "--show-leak-kinds=all",
        "--track-origins=yes",
        "--log-file=valgrind-out.txt",
        filepath
      },
    }
  end,
  condition = {
    filetype = { "cpp", "c", "cmake" },
  },
}
