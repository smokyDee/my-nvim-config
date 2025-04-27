call plug#begin()

Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'vim-airline/vim-airline'

Plug 'mattn/emmet-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'ryanoasis/vim-devicons'

"colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tomasiser/vim-code-dark'

Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

Plug 'akinsho/toggleterm.nvim', {'tag':'*'}
"For color the brackets
Plug 'frazrepo/vim-rainbow'

Plug 'nvimdev/indentmini.nvim'

Plug 'numToStr/FTerm.nvim'

Plug 'kevinhwang91/rnvimr'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'mattesgroeger/vim-bookmarks'

Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

Plug 'jackMort/ChatGPT.nvim'

Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'Shatur/neovim-session-manager'
Plug 'coffebar/neovim-project'

Plug 'dominikduda/vim_current_word'

Plug 'easymotion/vim-easymotion'

Plug 'startup-nvim/startup.nvim'
call plug#end()

" config from /lua folder
lua require('noice_config')
lua require('chat_gpt')
lua require('project')
lua require('nvim_dashboard')

let mapleader=" "

"Tab indentation
set tabstop=3
set shiftwidth=3

set number
set relativenumber
set mouse=r
set mouse+=a
set cursorline

set noswapfile

set termguicolors


colorscheme codedark

"Keybinding
nnoremap nt :NERDTreeToggle<CR>
nnoremap no :NERDTree<CR>
nnoremap nc :NERDTreeClose<CR>

nnoremap <Leader>of :Telescope oldfiles<CR>
nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>lg :Telescope live_grep<CR>
nnoremap <Leader>gs :Telescope grep_string<CR>
nnoremap <Leader>cb :Telescope current_buffer_fuzzy_find<CR>
nnoremap <Leader>fb :Telescope file_browser<CR>

nnoremap gs :GoDefStack<CR>
nnoremap gr :GoRef<CR>
nnoremap gi :GoImplements<CR>
nnoremap <F1> :GoDoc<CR>

nnoremap ss :vsplit<CR>
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
"to move between windows
nnoremap sn <C-w>w
nnoremap sp <C-w>p
nnoremap <S-t> :FTermToggle<CR>
nnoremap <S-e> :RnvimrToggle<CR>
nnoremap <S-o> :CocCommand prettier.formatFile<CR>

nnoremap tn :BufferNext<CR>
nnoremap tp :BufferPrevious<CR>
nnoremap tc :BufferClose<CR>
nnoremap ta :BufferCloseAllButCurrent<CR>
nnoremap tz :BufferPick<CR>

nnoremap <S-p> :NeovimProjectDiscover<CR>

"for vertical movement
nnoremap <S-l> <S-l>zz
nnoremap <S-h> <S-h>zz


"Autoclose brackets
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" to scroll with tab through the code suggestions
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Word navigation
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>e <Plug>(easymotion-e)
nmap <Leader>b <Plug>(easymotion-b)


let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

au FileType vim,go,lua call rainbow#load()

let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

"use indentlines
lua  require("indentmini").setup()

lua vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
lua vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
