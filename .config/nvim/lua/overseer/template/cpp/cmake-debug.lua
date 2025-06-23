return {
  name = "cmake debug",
  builder = function()
    return {
      cmd = { "cmake" },
      args = { "--build", "build" },
      components = {
        {
          "dependencies",
          task_names = {
            { cmd = "cmake", args = { "-DCMAKE_BUILD_TYPE=Debug", "-B", "build", "." } }
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
