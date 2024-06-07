return {
  {
    "rmagatti/auto-session",
    config = function()
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
      require('auto-session').setup({
        log_level = 'error',
        auto_restore_enabled = true,
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_session_create_enabled = true,
        pre_save_cmds = { 'Neotree close' },
        post_restore_cmds = { 'Neotree filesystem show' },
      })
    end
  }
}
