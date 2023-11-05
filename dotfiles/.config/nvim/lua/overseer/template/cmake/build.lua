return {
  name = "cmake build",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "--build", "build", "--config", "Release" },
      components = {
        {
          "dependencies",
          task_names = {
            { cmd = "cmake", args = { "-B", "build", "." } }
          },
        },
        { "on_output_quickfix", open = false },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp", "c", "cmake" },
  },
}
