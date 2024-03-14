vim.g.mapleader = " "
local wk = require("which-key")
local telescope = require("telescope.builtin")
local map = vim.keymap.set

-- about diagnostic
-- Global mappings.
-- See `:help vim.diagnostic.*`
-- for documentation on any of the below functions
wk.register(
  {
    d = {
      name = "about diagnostic",
      o = { vim.diagnostic.open_float, "open float window of this diagnostic" },
      l = { "<cmd>Trouble document_diagnostics<CR>", "list all diagnostics in document" },
      w = { "<cmd>Trouble workspace_diagnostics<CR>", "list all diagnostics in workspace" },
      n = { vim.diagnostic.goto_next, "go to next diagnostic" },
      p = { vim.diagnostic.goto_prev, "go to previous diagnostic" },
      s = { vim.diagnostic.show, "show all the diagnostics in the buffer" },
      h = { vim.diagnostic.hide, "hide all the diagnostics in the buffer" },
    }
  },
  { prefix = "<leader>" }
)

-- about lsp
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    wk.register(
      {
        l = {
          name = "about lsp",
          h = { vim.lsp.buf.hover, "hover" },
          f = { function() vim.lsp.buf.format { async = true } end, "format" },
          r = { telescope.lsp_references, "references" },
          n = { vim.lsp.buf.rename, "rename" },
          d = { telescope.lsp_definitions, "definitions" },
          D = { vim.lsp.buf.declaration, "declaration" },
          s = { telescope.lsp_document_symbols, "symbols of the ducument" },
          i = { telescope.lsp_implementations, "implementations" },
          m = { telescope.lsp_incoming_calls, "incoming calls" },
          g = { telescope.lsp_outgoing_calls, "outgoing calls" },
          t = { telescope.lsp_type_definitions, "type definitions" },
          w = { telescope.lsp_workspace_symbols, "workspace symbols" },
          p = { telescope.lsp_dynamic_workspace_symbols, "dynamic workspace symbols" },
          c = { vim.lsp.buf.code_action, "code action" },
          e = { vim.lsp.buf.signature_help, "signature help" },
          a = { vim.lsp.buf.add_workspace_folder, "add workspace folder" },
          x = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder" },
          l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "list workspace folders" },
        }
      },
      { prefix = "<leader>", buffer = ev.buf }
    )
  end,
})

-- about neotree
wk.register(
  {
    n = {
      name = "about neo-tree",
      f = { "<cmd>Neotree source=filesystem<CR>", "filesystem in neo-tree" },
      b = { "<cmd>Neotree source=buffers<CR>", "buffers in neo-tree" },
      g = { "<cmd>Neotree source=git_status<CR>", "git in neo-tree" },
      s = { "<cmd>Neotree source=document_symbols<CR>", "symbols in neo-tree" },
      c = { "<cmd>Neotree close<CR>", "close neo-tree" },
    }
  },
  { prefix = "<leader>" }
)

-- about buffer
wk.register(
  {
    name = "about buffer",
    p = { "<cmd>BufferLinePick<CR>", "pick buffer" },
    c = { "<cmd>BufferLinePickClose<CR>", "close specific buffer" },
    o = { "<cmd>BufferLineCloseOthers<CR>", "close other buffer" },
    r = { "<cmd>BufferLineCloseRight<CR>", "close right buffer" },
    l = { "<cmd>BufferLineCloseLeft<CR>", "close left buffer" },
    s = { "<cmd>BufferLineSortByDirectory<CR>", "sort by directory" },
  },
  { prefix = "<leader>b" }
)

wk.register(
  {
    name = "about buffer",
    H = { "<cmd>BufferLineCyclePrev<CR>", "go to previous buffer" },
    L = { "<cmd>BufferLineCycleNext<CR>", "go to next buffer" },
    C = { "<cmd>bd<CR>", "close current buffer" },
    -- r = {"<cmd>BufferLineCloseRight<CR>", "close right buffer"},
    -- l = {"<cmd>BufferLineCloseLeft<CR>", "close left buffer"},
  }
)

-- about open options
wk.register(
  {
    name = "about open options",
    h = { "<cmd>lua vim.lsp.inlay_hint.enable()<CR>", "open inlay_hint" },
    t = { "<cmd>sp term://nu<CR>", "open terminal" },
  },
  { prefix = "<leader>o" }
)

-- about terminal
wk.register(
  {
    name = "about terminal",
    ["esc"] = { "<C-\\><C-N>", "esc" },
    ["<C-w>h"] = { "<C-\\><C-N><C-w>h", "esc" },
    ["<C-w>l"] = { "<C-\\><C-N><C-w>l", "esc" },
    ["<C-w>j"] = { "<C-\\><C-N><C-w>j", "esc" },
    ["<C-w>k"] = { "<C-\\><C-N><C-w>k", "esc" },
  },
  { mode = "t" }
)

-- about telescope
wk.register(
  {
    t = {
      name = "about telescope",
      a = { "<cmd>Telescope autocommand<CR>", "autocommand" },
      b = { "<cmd>Telescope buffers<CR>", "buffers" },

      c = { name = "command" },
      ch = { "<cmd>Telescope command_history<CR>", "command_history" },
      cm = { "<cmd>Telescope commands<CR>", "commands" },

      f = { name = "find" },
      ff = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "current_buffer_fuzzy_find" },
      fd = { "<cmd>Telescope fd<CR>", "fd" },
      fs = { "<cmd>Telescope grep_string<CR>", "grep_string" },
      fh = { "<cmd>Telescope help_tags<CR>", "help_tags" },
      fk = { "<cmd>Telescope highlights<CR>", "highlights" },
      fl = { "<cmd>Telescope live_grep<CR>", "live_grep" },
      fm = { "<cmd>Telescope man_pages<CR>", "man_pages" },
      fo = { "<cmd>Telescope oldfiles<CR>", "oldfiles" },


      g = { name = "git" },
      gt = { "<cmd>Telescope git_bcommits<CR>", "git_bcommits" },
      gb = { "<cmd>Telescope git_branches<CR>", "git_branches" },
      gc = { "<cmd>Telescope git_commits<CR>", "git_commits" },
      gf = { "<cmd>Telescope git_files<CR>", "git_files" },
      gh = { "<cmd>Telescope git_stash<CR>", "git_stash" },
      gs = { "<cmd>Telescope git_status<CR>", "git_status" },

      l = { name = "lsp" },
      ld = { "<cmd>Telescope lsp_definitions<CR>", "lsp_definitions" },
      ls = { "<cmd>Telescope lsp_document_symbols<CR>", "lsp_document_symbols" },
      lm = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "lsp_dynamic_workspace_symbols" },
      li = { "<cmd>Telescope lsp_implementations<CR>", "lsp_implementations" },
      ln = { "<cmd>Telescope lsp_incoming_calls<CR>", "lsp_incoming_calls" },
      lo = { "<cmd>Telescope lsp_outgoing_calls<CR>", "lsp_outgoing_calls" },
      lr = { "<cmd>Telescope lsp_references<CR>", "lsp_references" },
      lt = { "<cmd>Telescope lsp_type_definitions<CR>", "lsp_type_definitions" },
      lw = { "<cmd>Telescope lsp_workspace_symbols<CR>", "lsp_workspace_symbols" },

      j = { "<cmd>Telescope jumplist<CR>", "jumplist" },
      d = { "<cmd>Telescope diagnostics<CR>", "diagnostics" },
      k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
      u = { "<cmd>Telescope pickers<CR>", "pickers" },
      p = { "<cmd>Telescope projects<CR>", "projects" },
      r = { "<cmd>Telescope registers<CR>", "registers" },
      h = { "<cmd>Telescope search_history<CR>", "search_history" },
      v = { "<cmd>Telescope vim_options<CR>", "vim_options" },
    }
  },
  { prefix = "<leader>" }
)

-- about dap
wk.register(
  {
    ["<F5>"] = { function() require('dap').continue() end, "continue" },
    ["<F6>"] = { function() require('dap').terminate() end, "terminate" },
    ["<F10>"] = { function() require('dap').step_over() end, "step over" },
    ["<F11>"] = { function() require('dap').step_into() end, "step into" },
    ["<F12>"] = { function() require('dap').step_out() end, "step out" },
  }
)
wk.register(
  {
    g = {
      name = "about debug",
      ["<F5>"] = { function() require('dap').continue() end, "continue" },
      ["<F6>"] = { function() require('dap').terminate() end, "terminate" },
      ["<F10>"] = { function() require('dap').step_over() end, "step over" },
      ["<F11>"] = { function() require('dap').step_into() end, "step into" },
      ["<F12>"] = { function() require('dap').step_out() end, "step out" },
      b = { function() require('dap').toggle_breakpoint() end, "toggle breakpoint" },
      B = { function() require('dap').set_breakpoint() end, "set breakpoint" },
      l = { function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, "set breakpoint with log" },
      c = { function() require('dap').set_breakpoint(vim.fn.input('breakpoint condition: '), nil, nil) end, "set breakpoint with condition" },
      C = { function() require('dap').clear_breakpoints() end, "clear all breakpoints" },
      p = { function() require('dap').pause() end, "pause thread" },
      u = { function() require('dap').up() end, "go up in current stacktrace" },
      d = { function() require('dap').down() end, "go down in current stacktrace" },
      r = { function() require('dap').repl.open() end, "open repl" },
    }
  },
  { prefix = "<leader>" }
)

-- about neovim itself
map("i", "jj", "<esc>")
map("n", "qa", function() vim.cmd("wqa") end)
map("n", "<C-j>", "4j")
map("n", "<C-k>", "4k")
