local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "typescript", "typescriptreact", "javascript", "javascriptreact", "json" } },
   b.code_actions.eslint_d.with { filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"} },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
