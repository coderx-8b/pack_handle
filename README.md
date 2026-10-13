# pack_handle

A polished UI for Neovim's native `vim.pack` package manager (Neovim 0.12+).

Run `:MyPack` to open the package list.

- `a` prompts for a Git URL, saves it to `~/.config/nvim/lua/plugins/init.lua`, then installs it.
- `s` opens **Discover**, an Awesome Neovim catalog browser.
- `e` toggles the selected plugin's enabled state while keeping its files installed.
- `u` opens Neovim's update confirmation for the selected plugin; `U` opens it for all installed plugins.
- `d` deletes the selected plugin and removes its URL entry from that `vim.pack.add({ ... })` table.
- `r` refreshes the installed-plugin list; `q` closes the window.

Enable/disable changes update the configured `vim.pack.add()` declaration. Disabling
keeps the plugin on disk; restart Neovim for it to stop loading. Enabling activates
it immediately when possible and also keeps it enabled on future starts. A plugin
that has already run cannot be fully unloaded from the current Neovim session.

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
  config_file = vim.fn.stdpath("config") .. "/lua/plugins/init.lua",
  -- Optional: customize where the Awesome Neovim cache is stored.
  cache_file = vim.fn.stdpath("data") .. "/pack_handle/awesome-neovim.json",
})
```

## Updating a local copy

To install or update this checkout as a native Neovim package, run:

```sh
./install-local.sh
```

The script syncs the plugin to `stdpath("data")/site/pack/core/opt/pack_handle` (by default,
`~/.local/share/nvim/site/pack/core/opt/pack_handle`). It uses `XDG_DATA_HOME` when set
and requires `rsync`. Restart Neovim after syncing. To use a different plugin directory,
pass it as the first argument:

```sh
./install-local.sh /path/to/nvim/site/pack/core/opt/pack_handle
```
