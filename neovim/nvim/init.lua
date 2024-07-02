require('coconut');
vim.cmd('colorscheme 2077');
vim.cmd('set wrap');
vim.g.clipboard = { --this is just for wayland clipboard
    name = 'WL-clipboard',
    copy = {
        ['+'] = 'wl-copy --foreground',
        ['*'] = 'wl-copy --foreground --primary',
    },
    paste = {
        ['+'] = 'wl-paste --no-newline',
        ['*'] = 'wl-paste --no-newline --primary',
    },
    cache_enabled = 1,
};

require('tabnine').setup({ -- Activation and compatiblity config for tabnine
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
});

vim.g.dashboard_default_executive = 'telescope';
