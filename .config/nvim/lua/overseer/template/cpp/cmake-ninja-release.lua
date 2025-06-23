return {
  name = "cmake ninja release",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "--build", "build", "--config", "Release" },
      components = {
        {
          "dependencies",
          task_names = {
            { cmd = "cmake", args = { "-B", "build", "-G", "Ninja Multi-Config", "." } }
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
