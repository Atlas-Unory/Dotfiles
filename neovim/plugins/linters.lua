-- lua/plugins/lint.lua
return {

  -- nvim-lint is already included by LazyVim → we only override/extend
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Linters by filetype (call :Mason to install them!)
      linters_by_ft = {
        javaScript = { "eslint_d" },
        typeScript = { "eslint_d" },
        javaScriptreact = { "eslint_d" },
        typeScriptreact = { "eslint_d" },
        -- vue         = { "eslint_d" },
        -- svelte      = { "eslint_d" },
        -- python = { "pylint" }, -- very fast & good replacement for flake8+pylint
        -- go          = { "golangcilint" },
        -- lua         = { "selene" },        -- strict lua linter (alternative: luacheck)
        sh = { "shellcheck" },
        -- markdown    = { "markdownlint" },
        -- dockerfile  = { "hadolint" },
        yaml = { "yamllint" },

        -- Add global linters (run on every file)
        -- ["*"] = { "typos" },           -- spellchecker for code

        -- Fallback linters (only when no other is defined)
        ["_"] = { "typos" },
      },

      -- Optional: change when linters are triggered
      -- Default is quite good already → { "BufWritePost", "BufReadPost", "InsertLeave" }
      -- events = { "BufWritePost" },
    },
  },
}
