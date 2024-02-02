-- make sure the lazy plugin has been installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local all_plugins = {}
-- about lsp
local lsp_plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/lsp_plugins"
vim.opt.rtp:prepend(lsp_plugins_path)
local lsp_plugins_prefix = "plugins.lsp_plugins."
local mason = require(lsp_plugins_prefix .. "mason")
table.insert(all_plugins, mason)
local mason_lspconfig = require(lsp_plugins_prefix .. "mason_lspconfig")
table.insert(all_plugins, mason_lspconfig)
local lspconfig = require(lsp_plugins_prefix .. "lspconfig")
table.insert(all_plugins, lspconfig)
local neodev = require(lsp_plugins_prefix .. "neodev")
table.insert(all_plugins, neodev)

-- about cmp
local cmp_plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/cmp_plugins"
vim.opt.rtp:prepend(cmp_plugins_path)
local cmp_plugins_prefix = "plugins.cmp_plugins."
local cmp_nvim_lsp = require(cmp_plugins_prefix .. "cmp_nvim_lsp")
table.insert(all_plugins, cmp_nvim_lsp)
local luasnip = require(cmp_plugins_prefix .. "luasnip")
table.insert(all_plugins, luasnip)
local nvim_cmp = require(cmp_plugins_prefix .. "nvim_cmp")
table.insert(all_plugins, nvim_cmp)
local cmp_nvim_lua = require(cmp_plugins_prefix .. "cmp_nvim_lua")
table.insert(all_plugins, cmp_nvim_lua)

--about tools
local tools_plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/tools_plugins"
vim.opt.rtp:prepend(tools_plugins_path)
local tools_plugins_prefix = "plugins.tools_plugins."
local which_key = require(tools_plugins_prefix .. "which_key")
table.insert(all_plugins, which_key)
local plenary = require(tools_plugins_prefix .. "plenary")
table.insert(all_plugins, plenary)
local neo_tree = require(tools_plugins_prefix .. "neo_tree")
table.insert(all_plugins, neo_tree)
local bufferline = require(tools_plugins_prefix .. "bufferline")
table.insert(all_plugins, bufferline)
local lualine = require(tools_plugins_prefix .. "lualine")
table.insert(all_plugins, lualine)
local telescope = require(tools_plugins_prefix .. "telescope")
table.insert(all_plugins, telescope)
local nvim_treesitter = require(tools_plugins_prefix .. "nvim_treesitter")
table.insert(all_plugins, nvim_treesitter)
local comment = require(tools_plugins_prefix .. "comment")
table.insert(all_plugins, comment)
local noice = require(tools_plugins_prefix .. "noice")
table.insert(all_plugins, noice)
local dashboard_nvim = require(tools_plugins_prefix .. "dashboard_nvim")
table.insert(all_plugins, dashboard_nvim)

-- about colorscheme
local colorscheme_plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/colorscheme_plugins"
vim.opt.rtp:prepend(colorscheme_plugins_path)
local colorscheme_plugins_prefix = "plugins.colorscheme_plugins."
local tokyonight = require(colorscheme_plugins_prefix .. "tokyonight")
table.insert(all_plugins, tokyonight)

-- about dap
local dap_plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/dap_plugins"
vim.opt.rtp:prepend(dap_plugins_path)
local dap_plugins_prefix = "plugins.dap_plugins."
local nvim_dap = require(dap_plugins_prefix .. "nvim_dap")
table.insert(all_plugins, nvim_dap)
local nvim_dap_ui = require(dap_plugins_prefix .. "nvim_dap_ui")
table.insert(all_plugins, nvim_dap_ui)

require("lazy").setup(all_plugins)
return {}
