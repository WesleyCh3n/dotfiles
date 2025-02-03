return {
  name = "cmake ninja debug",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "--build", "build", "--config", "Debug" },
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
