local config = function ()
  require("plenary.filetype").add_file('foo')
end
return {
  "nvim-lua/plenary.nvim",
  config = config,
}
