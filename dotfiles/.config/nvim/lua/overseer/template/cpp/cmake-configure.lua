return {
  name = "cmake configure",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "-B", "build", "." },
    }
  end,
  condition = {
    filetype = { "cpp", "c", "cmake" },
  },
}
