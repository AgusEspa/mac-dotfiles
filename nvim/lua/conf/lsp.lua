require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities(capabilities)
)

lspconfig.eslint.setup({})
lspconfig.stylelint_lsp.setup({
  filetypes = { "css", "less", "scss" }
})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({})
lspconfig.html.setup({})
lspconfig.lua_ls.setup({})
lspconfig.yamlls.setup({})
lspconfig.clangd.setup({
  filetypes = { "c", "cpp" },
})
lspconfig.omnisharp.setup({})
lspconfig.tsserver.setup({})
lspconfig.gopls.setup({})
lspconfig.golangci_lint_ls.setup({})
lspconfig.bufls.setup({})
lspconfig.jdtls.setup({})
lspconfig.angularls.setup({})
lspconfig.svelte.setup({})
lspconfig.bashls.setup({})
lspconfig.sqlls.setup({})
lspconfig.lemminx.setup({
  settings = {
    xml = {
      format = {
        enabled = false,
        splitAttributes = false,
        joinCDATALines = false,
        joinCommentLines = false,
        formatComments = true,
        joinContentLines = false,
        spaceBeforeEmptyCloseTag = false
      }
    }
  }
})

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'python', 'java', 'c', 'cpp', 'go', 'gomod', 'gosum', 'typescript', 'svelte', 'tsx', 'css', 'html', 'scss', 'javascript', 'json', 'vimdoc', 'gitignore' },
}

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#1e1e2e" })

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    source = 'always',
    border = 'single',
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

require("luasnip.loaders.from_vscode").lazy_load()
require 'luasnip'.filetype_extend("javascript", { "react" })

-- nvim-cmp
local cmp = require 'cmp'
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:CmpNormal",
    },
    documentation = {
      winhighlight = "Normal:CmpNormal",
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = "<CR>",
  dismiss_keymap = "<Left>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- absolute path to Tabnine log file
})
