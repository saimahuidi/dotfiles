local chosen_colorscheme = "catppuccin-frappe"
local success, _ = pcall(vim.cmd, "colorscheme " .. chosen_colorscheme)
if not success then
  vim.notify("colorscheme: " ..  chosen_colorscheme .. "not found!")
  return
end
