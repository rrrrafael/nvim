local get_intelephense_licence = function()
  local f =
    assert(io.open(os.getenv("HOME") .. "/intelephense/licence.txt", "rb"))
  local content = f:read("*a")
  f:close()
  return string.gsub(content, "%s+", "")
end

local mason_lspconfig = {
  options = {
    ensure_installed = {
      "clangd",
      "emmet_language_server",
      "intelephense",
      "lua_ls",
      "marksman",
      "pyright",
      "tsserver",
    },
  },

  setup = function()
    local lspconfig = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server)
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end,

      ["emmet_language_server"] = function()
        lspconfig["emmet_language_server"].setup({
          capabilities = capabilities,
          filetype = { "css", "html", "javascripty" },
        })
      end,

      ["intelephense"] = function()
        lspconfig["intelephense"].setup({
          capabilities = capabilities,
          setting = {
            intelephense = {
              init_options = {
                licenceKey = get_intelephense_licence(),
              },
            },
          },
        })
      end,

      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          setting = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}

local mason_tool_installer = {
  options = {
    ensure_installed = {
      "biome",
      "phpcs",
      "phpstan",
      "php-cs-fixer",
      "prettier",
      "pylint",
      "ruff",
      "shellcheck",
      "shfmt",
      "stylua",
    },
  },
}

local lazy = {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = mason_lspconfig.options,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = mason_tool_installer.options,
    },
  },
  config = mason_lspconfig.setup,
}

return lazy
