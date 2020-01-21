runtime bundle/vim-pathogen/autoload/pathogen.vim           " autoload all plugins in ~/.vim/bundle
execute pathogen#infect()
syntax on                                                   " turn on syntastic

let g:syntastic_check_on_open = 1                           " run syntastic when first opening a file
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

set encoding=utf-8                                          " file encoding
set nocompatible                                            " probably not necessary
set nowrap                                                  " don't wrap long lines around
set autochdir                                               " change the working directory when opening a file
set number                                                  " show line numbers

set incsearch                                               " search-as-you-type
set hlsearch                                                " highlight all matches
set ignorecase                                              " case insensitive search by default
set smartcase                                               " case sensitive if you have any caps in your query

set wildmode=longest:full,list                              " tab completion
set wildmenu                                                " tab completion
set backspace=indent,eol,start                              " so you can backspace past where you started input mode

set list                                                    " show invisible characters
set listchars=tab:▸\.,trail:-,extends:»,precedes:«          " set what the invisible characters should look like
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set filetype=on                                             " autodetect filetype
filetype plugin on                                          " load plugins for specific filetypes
filetype indent on                                          " load indentation settings for specific filetypes
set autoindent                                              " use the indentation of previous line when starting a new line
set expandtab                                               " when hitting <tab> key, insert spaces instead
set tabstop=4                                               " how big a tab looks
set softtabstop=4                                           " how many spaces to insert when hitting <tab> key
set shiftwidth=4                                            " how many spaces to add/remove when >> or <<'ing

set wildignore+=*/tmp/*                                     " ctrlp - ignore files in tmp directories
set wildignore+=*/target/*                                  " ctrlp - ignore files in target directories
set wildignore+=*/build/*                                   " ctrlp - ignore gradle build directories
set wildignore+=*.so                                        " ctrlp - ignore .so files
set wildignore+=*.o                                         " ctrlp - ignore .o files
set wildignore+=*.class                                     " ctrlp - ignore .class files
set wildignore+=*.swp                                       " ctrlp - ignore .swp files
set wildignore+=*.zip                                       " ctrlp - ignore .zip files
set wildignore+=*.pdf                                       " ctrlp - ignore .pdf files
set wildignore+=*/node_modules/*                            " ctrlp - ignore node modules
set wildignore+=*/bower_components/*                        " ctrlp - ignore bower components
set wildignore+=*/dist/*                                    " ctrlp - ignore grunt build directory

let g:ctrlp_by_filename = 0                                 " ctrlp - don't search by filename by default (use full path instead)
let g:ctrlp_show_hidden = 0                                 " ctrlp - don't search for hidden files
let g:ctrlp_regexp = 0                                      " ctrlp - don't use regexp matching
let g:ctrlp_root_markers = ['pom.xml', 'Config', 'Gruntfile.js', 'package.json', 'build.gradle', '.bashrc']
let g:ctrlp_switch_buffer = 1

colorscheme gruvbox                                             " choose the colorscheme
set background=dark                                         " dark mode
set guifont=Monaco\ 10                                      " set the font if you're in gvim

set nobackup "Disable backup files

" check the current folder for tags file and keep going one directory up all the way to the root folder. So you can be in any sub-folder in your project and it'll be able to find the tags files.
set tags=tags;/

" open every file you open in a vertical split on the right side
set splitright

" begin colors for syntastic highlighting "
hi SpellBad ctermfg=009 ctermbg=019 guifg=#ffffff guibg=#ff0000
hi SpellCap ctermfg=002 ctermbg=019 guifg=#ffffff guibg=#ff0000
" end colors for syntastic highlighting "

" begin StatusLine "
set laststatus=2
set statusline=%F%m%r%h%w\ %=%<%1.30{getcwd()}\ [line\ %l\/%L\ \|\ col\ %v]

hi StatusLine ctermfg=Black ctermbg=White guifg=Black guibg=White
au InsertEnter * hi StatusLine ctermbg=DarkBlue guibg=DarkBlue
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White guifg=Black guibg=White
" end StatusLine "

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Ctrl-Shift-PageUp and Ctrl-Shift-PageDown should move tabs left/right
noremap <C-S-PageUp> :tabm -1<CR>
noremap <C-S-PageDown> :tabm +1<CR>

" NETRW OPTIONS
let g:netrw_liststyle = 3 "netrw view type set to 3 (tree mode)
let g:netrw_browse_split = 4 "file open from netrw will be open in the previous right window 
let g:netrw_altv = 1
let g:netrw_winsize = 20 "width of netrw split set to 25%
let g:netrw_banner = 0 "get rid of useless banner
" Show line numbers in netrw/directory browser/explorer
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

