if vim.g.loaded_pack_handle then
  return
end
vim.g.loaded_pack_handle = true

vim.api.nvim_create_user_command("MyPack", function()
  require("pack_handle").open()
end, { desc = "Open the native package manager" })
