return {
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        runnables = {
          use_telescope = true,
        },
      },
      server = {
        -- on_attach = require("plugins.lsp.keymaps").on_attach, // FIXME:
        settings = {
          ["rust-analyzer"] = {
            inlayHints = { locationLinks = false },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
  }
}
