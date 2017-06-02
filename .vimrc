if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
"set ts=2
"set sts=2
" set nosta " turn off smart tab
"set noai  " turn" off auto indent
set preserveindent
set copyindent
set smartindent
set softtabstop=0
set tabstop=8
set shiftwidth=8
"set expandtab
set ic
au FileType *.c set textwidth=72	" gqG to wrap text to end of file. gqq to wrap line. gq} for paragraph
au FileType gitcommit set textwidth=72	" gqG to wrap text to end of file. gqq to wrap line. gq} for paragraph
set nojoinspaces

"set foldmarker={,}
"set foldmethod=syntax
"set foldlevel=0
"set foldnestmax=1
"set foldclose=all

"map ^ to search for word under cursor
nnoremap ^ :!grep -n '\<<cword>\>' *<CR>

au FileType * setl fo-=cro " Turn off the Auto-comments
"au FileType * match Error /\s\+$\|    / " Highlight ending whitespace, tabs
au FileType * match Error /\s\+$/ " Highlight ending whitespace
set incsearch
set showmatch
"syntax enable
"if has('gui_running')
" set background=light
"else
"  set background=dark
"endif
"set t_Co=16
"let g:solarized_termcolors=16
"colorscheme solarized


" Wish I could switch between these two depending on if I have a display (vnc) or not
"colorscheme darkblue
"colorscheme delek
"colorscheme default
colo ron


"highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
"highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
"highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta

"change completion type
set wildmode=longest,list,full
set wildmenu

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" set mouse=a
let &mouse = "a"
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
"set hitory=50		" keep 50 lines of command line history
"set ruer		" show the cursor position all the time

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8"
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

set colorcolumn=80
" let &colorcolumn="80," " .join(range(120,999),",")
"hi ColorColumn ctermbg=232 guibg=#2c2d27
hi ColorColumn ctermbg=4 guibg=#2c2d27

" vimdiff
if &diff
	colorscheme darkblue
endif


hi ModeMsg ctermfg=cyan
hi MoreMsg ctermfg=cyan

"execute pathogen#infect()
