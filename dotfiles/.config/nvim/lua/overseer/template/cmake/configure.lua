return {
  name = "cmake configure",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "-B", "build", "." },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp", "c", "cmake" },
  },
}
