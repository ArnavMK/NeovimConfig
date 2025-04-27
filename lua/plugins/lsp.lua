return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- Configure floating window appearance
    local border = {
      { "🭽", "FloatBorder" },
      { "▔", "FloatBorder" },
      { "🭾", "FloatBorder" },
      { "▕", "FloatBorder" },
      { "🭿", "FloatBorder" },
      { "▁", "FloatBorder" },
      { "🭼", "FloatBorder" },
      { "▏", "FloatBorder" },
    }

    -- Override LSP handlers for better UI
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      opts.scrollbar = false
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Set hover window to be transparent with border
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = border,
        scrollbar = false,
        -- Transparent background
        focusable = false,
        style = "minimal",
        -- Use a highlight group with transparent background
        close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
      }
    )

    -- Set signature help to match hover style
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = border,
        scrollbar = false,
        focusable = false,
        style = "minimal",
      }
    )

    -- Create highlight groups for floating windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl(0, { name = 'NormalFloat' }).fg,
      bg = 'none', -- Transparent background
    })
    vim.api.nvim_set_hl(0, 'LspFloatWinNormal', {
      bg = 'none', -- Transparent background
    })

    -- Enhanced capabilities with nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- LSP keymaps and autocommands
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
      callback = function(event)
        -- Helper function for easier key mapping
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Navigation
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Workspace
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'v' })

        -- Documentation (Shift+K to show hover info)
        map('K', function()
          local winid = vim.lsp.buf.hover()
          if winid then
            vim.api.nvim_win_set_option(winid, 'winblend', 10) -- Add transparency
          end
        end, 'Hover Documentation')

        -- Signature help with same styling
        map('<C-k>', function()
          local winid = vim.lsp.buf.signature_help()
          if winid then
            vim.api.nvim_win_set_option(winid, 'winblend', 10)
          end
        end, 'Signature Documentation')

        -- Rust Analyzer specific mappings
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.name == 'rust_analyzer' then
          -- Toggle inlay hints
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')

          -- Toggle diagnostics (errors/warnings)
          map('<leader>td', function()
            local current = vim.diagnostic.is_disabled(event.buf)
            vim.diagnostic.enable(not current, event.buf)
          end, '[T]oggle [D]iagnostics')
        end

        -- Highlight references
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    -- Rest of your LSP configuration remains the same...
    -- [Keep all your existing server configurations here]
    
    -- Language Server Setup
    local servers = {
      -- [Your existing server configurations]
    }

    -- Mason setup
    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = vim.tbl_keys(servers),
      auto_update = true,
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    -- Global diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
      float = {
        border = border,
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Custom signs for diagnostics
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
