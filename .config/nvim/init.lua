local execute = vim.api.nvim_command
local fn = vim.fn
local map = vim.api.nvim_set_keymap
local o = vim.o

local install_path = fn.stdpath('data')..'/site/pack/paqs/start/paq-nvim/'

if fn.empty(fn.glob(install_path)) > 0 then
  print('Installing paq...')
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
  print('paq installed to ' .. install_path)
  execute 'packadd paq-nvim'
end

require("paq") {
    "savq/paq-nvim";

    "LnL7/vim-nix";
    "airblade/vim-gitgutter";
    "fatih/vim-go";
    "junegunn/fzf";
    "junegunn/fzf.vim";
    "neovim/nvim-lspconfig";
    "ziglang/zig.vim";

    "hrsh7th/nvim-compe";
}

require("compe").setup {
   enabled = true;
   autocomplete = true;
   source = {
     path = true;
     buffer = true;
     calc = true;
     nvim_lsp = true;
     nvim_lua = true;
     vsnip = true;
     ultisnips = true;
     luasnip = true;
   };
}

local lspc = require("lspconfig") 
lspc.gopls.setup {};

vim.cmd("syntax off");
vim.cmd("source ~/.config/nvim/dumb.vim");
o.hlsearch = true;

vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })

