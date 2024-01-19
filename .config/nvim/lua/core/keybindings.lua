local map = vim.keymap.set
-- about diagnostic
-- Global mappings.
-- See `:help vim.diagnostic.*`
-- for documentation on any of the below functions
map('n', '<C-d>f', vim.diagnostic.open_float)
map('n', '<C-d>l', vim.diagnostic.setloclist)
map('n', '<C-d>n', vim.diagnostic.goto_next)
map('n', '<C-d>p', vim.diagnostic.goto_prev)
map('n', '<C-d>s', vim.diagnostic.show)
map('n', '<C-d>h', vim.diagnostic.hide)

-- about lsp
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- about neotree
-- open neotree source=filesystem
map("n", "<C-f>f",
function ()
  vim.cmd("Neotree source=filesystem reveal=true position=left")
end
)
-- open neotree source=buffers
map("n", "<C-f>b",
function ()
  vim.cmd("Neotree source=buffers reveal=true position=left")
end
)
-- open neotree source=git_status
map("n", "<C-f>g",
function ()
  vim.cmd("Neotree source=git_status reveal=true position=left")
end
)
-- open neotree source=document_symbols
map("n", "<C-f>s",
function ()
  vim.cmd("Neotree source=document_symbols reveal=true position=left")
end
)
-- open neotree
map("n", "<C-f>c",
function ()
  vim.cmd("Neotree close")
end
)


-- about neovim itself
map("i", "jj", "<esc>")
map("n", "qa",
function ()
  vim.cmd("wqa")
end
)

--about buffer
map("n", "<C-b>k",
function ()
  vim.cmd("BufferLineCycleNext")
end
)
map("n", "<C-b>j",
function ()
  vim.cmd("BufferLineCyclePrev")
end
)
map("n", "<C-b>p",
function ()
  vim.cmd("BufferLinePick")
end
)
map("n", "<C-b>c",
function ()
  vim.cmd("BufferLinePickClose")
end
)

-- about telescope
map("n", "<A-t>f",
function ()
  vim.cmd("Telescope find_files")
end
)

