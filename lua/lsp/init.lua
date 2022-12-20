local status_ok, lspconfig = pcall(require, "lspconfig")
local lspconfig_configs = require'lspconfig.configs'
local lspconfig_util = require 'lspconfig.util'

if not status_ok then
  return
end

--[[ require "lsp.lsp-installer" ]]
require "lsp.runbycmake"
require "lsp.mason"

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig.clangd.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  
  cmd = {"clangd"},
  filetypes={ "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir= lspconfig.util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        ),
}

lspconfig.cmake.setup{

}


lspconfig.volar.setup{

  init_options = {
      typescript = {
          tsdk = "/usr/lib/node_modules/typescript/lib"
      }
  }

}


--[[ local function on_new_config(new_config, new_root_dir) ]]
--[[   local function get_typescript_server_path(root_dir) ]]
--[[     local project_root = lspconfig_util.find_node_modules_ancestor(root_dir) ]]
--[[     return project_root and (lspconfig_util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')) ]]
--[[       or '' ]]
--[[   end ]]
--[[]]
--[[   if ]]
--[[     new_config.init_options ]]
--[[     and new_config.init_options.typescript ]]
--[[     and new_config.init_options.typescript.tsdk == '' ]]
--[[   then ]]
--[[     new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir) ]]
--[[   end ]]
--[[ end ]]
--[[]]
--[[ local volar_cmd = {'vue-language-server', '--stdio'} ]]
--[[ local volar_root_dir = lspconfig_util.root_pattern 'package.json' ]]
--[[]]
--[[ lspconfig_configs.volar_api = { ]]
--[[   default_config = { ]]
--[[     cmd = volar_cmd, ]]
--[[     root_dir = volar_root_dir, ]]
--[[     on_new_config = on_new_config, ]]
--[[     filetypes = { 'vue'}, ]]
--[[     -- If you want to use Volar's Take Over Mode (if you know, you know) ]]
--[[     --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }, ]]
--[[     init_options = { ]]
--[[       typescript = { ]]
--[[         tsdk = '' ]]
--[[       }, ]]
--[[       languageFeatures = { ]]
--[[         implementation = true, -- new in @volar/vue-language-server v0.33 ]]
--[[         references = true, ]]
--[[         definition = true, ]]
--[[         typeDefinition = true, ]]
--[[         callHierarchy = true, ]]
--[[         hover = true, ]]
--[[         rename = true, ]]
--[[         renameFileRefactoring = true, ]]
--[[         signatureHelp = true, ]]
--[[         codeAction = true, ]]
--[[         workspaceSymbol = true, ]]
--[[         completion = { ]]
--[[           defaultTagNameCase = 'both', ]]
--[[           defaultAttrNameCase = 'kebabCase', ]]
--[[           getDocumentNameCasesRequest = false, ]]
--[[           getDocumentSelectionRequest = false, ]]
--[[         }, ]]
--[[       } ]]
--[[     }, ]]
--[[   } ]]
--[[ } ]]
--[[ lspconfig.volar_api.setup{} ]]
--[[]]
--[[ lspconfig_configs.volar_doc = { ]]
--[[   default_config = { ]]
--[[     cmd = volar_cmd, ]]
--[[     root_dir = volar_root_dir, ]]
--[[     on_new_config = on_new_config, ]]
--[[]]
--[[     filetypes = { 'vue'}, ]]
--[[     -- If you want to use Volar's Take Over Mode (if you know, you know): ]]
--[[     --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }, ]]
--[[     init_options = { ]]
--[[       typescript = { ]]
--[[         tsdk = '' ]]
--[[       }, ]]
--[[       languageFeatures = { ]]
--[[         implementation = true, -- new in @volar/vue-language-server v0.33 ]]
--[[         documentHighlight = true, ]]
--[[         documentLink = true, ]]
--[[         codeLens = { showReferencesNotification = true}, ]]
--[[         -- not supported - https://github.com/neovim/neovim/pull/15723 ]]
--[[         semanticTokens = false, ]]
--[[         diagnostics = true, ]]
--[[         schemaRequestService = true, ]]
--[[       } ]]
--[[     }, ]]
--[[   } ]]
--[[ } ]]
--[[ lspconfig.volar_doc.setup{} ]]
--[[]]
--[[ lspconfig_configs.volar_html = { ]]
--[[   default_config = { ]]
--[[     cmd = volar_cmd, ]]
--[[     root_dir = volar_root_dir, ]]
--[[     on_new_config = on_new_config, ]]
--[[]]
--[[     filetypes = { 'vue'}, ]]
--[[     -- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json': ]]
--[[     --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }, ]]
--[[     init_options = { ]]
--[[       typescript = { ]]
--[[         tsdk = '' ]]
--[[       }, ]]
--[[       documentFeatures = { ]]
--[[         selectionRange = true, ]]
--[[         foldingRange = true, ]]
--[[         linkedEditingRange = true, ]]
--[[         documentSymbol = true, ]]
--[[         -- not supported - https://github.com/neovim/neovim/pull/13654 ]]
--[[         documentColor = false, ]]
--[[         documentFormatting = { ]]
--[[           defaultPrintWidth = 100, ]]
--[[         }, ]]
--[[       } ]]
--[[     }, ]]
--[[   } ]]
--[[ } ]]
--[[ lspconfig.volar_html.setup{} ]]
--[[]]
--[[]]
