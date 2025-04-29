# Neovim configuration

## Lua LSP configuration

Since the configuration is written in Lua, the Lua language server can be used to provide auto completion and other stuff.
To configure the LSP, a .luarc.json file has been added. To have Neovim definitions available, the workspace.library option has been set.
The value can be looked up via Neovim by issuing the command ":verbose version". Just copy the displayed value into the configuration.
