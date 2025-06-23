return {
  name = "cmake release",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "--build", "build", "--config", "Release" },
      components = {
        {
          "dependencies",
          task_names = {
            { cmd = "cmake", args = { "-DCMAKE_BUILD_TYPE=Release", "-B", "build", "." } }
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
