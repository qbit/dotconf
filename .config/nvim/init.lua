local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd
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
    "thindil/Ada-Bundle";

    "kyazdani42/nvim-tree.lua";
    "nvim-treesitter/nvim-treesitter";
    "kristijanhusak/orgmode.nvim";

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

cmd("syntax off");
cmd("source ~/.config/nvim/dumb.vim");

cmd("highlight OverLength ctermfg=red")
cmd("match OverLength /\\%79v.\\+/")

cmd("set dir=~/.swaps")
cmd("set nolist")
cmd("set ruler")
cmd("set mouse-=a")

o.hlsearch = true;

require'nvim-tree'.setup()

require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/org/*'},
  org_default_notes_file = '~/org/refile.org',
})
map("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true})
map('n', '<leader>bi', ':PaqInstall<CR>', {noremap = true})
map('n', '<leader>bu', ':PaqUpdate<CR>', {noremap = true})
map('n', '<leader>bc', ':PaqClean<CR>', {noremap = true})

map('n', '<learder>1', ':GitGutterToggle<CR>', {noremap = true})
map('n', '<learder>2', ':set list!<CR>', {noremap = true})
map('n', '<learder>3', ':set nu!<CR>', {noremap = true})
map('n', '<learder>4', ':set paste!<CR>', {noremap = true})

