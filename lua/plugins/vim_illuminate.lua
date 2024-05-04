return {
  -- plugin to highlight the word under the cursor
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({})
    end
  }
}
