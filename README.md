# pack_handle

A polished UI for Neovim's native `vim.pack` package manager (Neovim 0.12+).

Run `:MyPack` to open the package list.

- `a` prompts for a Git URL, saves it to `~/.config/nvim/lua/plugins/init.lua`, then installs it.
- `s` opens **Discover**, an Awesome Neovim catalog browser.
- `d` deletes the selected plugin and removes its URL entry from that `vim.pack.add({ ... })` table.
- `r` refreshes the installed-plugin list; `q` closes the window.

## Discover plugins

The Discover window searches a local, parsed cache of
[Awesome Neovim](https://github.com/rockerBOO/awesome-neovim). It never downloads
anything when Neovim starts.

- Press `r` in Discover to download and rebuild the catalog cache.
- Use `h` / `l` or Tab / Shift-Tab to switch category tabs.
- Press `/` (or `s`) to search names, descriptions, and categories.
- Press Enter on a result to write its URL to the config file and install it.

The cache is stored at `stdpath("data") .. "/pack_handle/awesome-neovim.json"`.
Refreshing requires `curl` to be available in `$PATH`.

Configure a different plugin declaration file before using the command:

```lua
require("pack_handle").setup({
  config_file = path_to_the_file_where_you_manages_plugins_via_vim_pack,
  -- Optional: customize where the Awesome Neovim cache is stored.
  cache_file = vim.fn.stdpath("data") .. "/pack_handle/awesome-neovim.json",
})
```
