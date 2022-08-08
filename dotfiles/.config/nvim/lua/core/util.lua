return {
  get = {
    config = function(path)
      return string.format("require[[configs.%s]]", path)
    end,
    setup = function(path)
      return string.format("require[[%s]].setup()", path)
    end,
  }
}
