local chosen_colorscheme = "tokyonight"
local success, _ = pcall(vim.cmd, "colorscheme " .. chosen_colorscheme)
if not success then
  vim.notify("colorscheme: " ..  chosen_colorscheme .. "not found!")
  return
end
