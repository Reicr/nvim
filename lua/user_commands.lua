-- OrganizeImports user command
-- The command will be used to try to organize imports
-- via the help of one of the attached LSPs.
vim.api.nvim_create_user_command(
  "OrganizeImports",
  function()
    -- Get all attached clients
    local clients = vim.lsp.get_clients()

    -- Send out the request to all servers
    -- that support the action
    for _, client in ipairs(clients) do
      -- Typescript
      if client.name == "typescript_ls" then
        client.exec_cmd(
          client, -- Not sure why Self is not implicit here
          {
            arguments = { vim.api.nvim_buf_get_name(0) },
            command = "_typescript.organizeImports",
            title = ""
          }
        )
      end
    end
  end,
  {}
)
