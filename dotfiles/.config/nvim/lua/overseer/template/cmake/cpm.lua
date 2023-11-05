return {
  name = "include CPM",
  builder = function()
    return {
      cmd = {
        "curl"
      },
      args = {
        "-fL",
        "https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake",
        "--output",
        "cmake/CPM.cmake",
      },
      components = {
        {
          "dependencies",
          task_names = {
            { cmd = "mkdir", args = { "-p", "cmake" } }
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
