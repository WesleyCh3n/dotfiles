return {
  --
  {
    'rcarriga/nvim-notify',
    lazy = false,
    opts = {
      background_colour = "#000000",
    },
    init = function()
    end,
    keys = {
      {
        "<space>n",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    config = function()
      require("notify").setup {
        stages = "static",
      }
      local banned_messages = { "No information available" }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end
  },
}
