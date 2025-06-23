return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        -- lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    },
  },
}
