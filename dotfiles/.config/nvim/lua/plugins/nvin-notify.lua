return {
  --
  {
    'rcarriga/nvim-notify',
    opts = {
      background_colour = "#000000",
    },
    init = function()
      local banned_messages = { "No information available" }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
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
  },
}
