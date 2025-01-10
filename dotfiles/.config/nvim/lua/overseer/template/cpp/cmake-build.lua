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
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp", "c", "cmake" },
  },
}
