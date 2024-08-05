

filetype plugin indent on

"以下の設定の必要性を確認しておくこと。重複箇所でここだけ被っていなかった。
set smarttab
set clipboard=unnamed

" matchit {{{
" if や for などの文字にも%で移動できるようになる
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" }}}



" usability {{{
" set t_Co=256は256色対応のターミナルソフトでのみ作用する
" Winのコマンドプロンプト使っている人は ダブルコーテーションでコメントアウトする
set t_Co=256

"シンタックスハイライトの設定
syntax on
"filetype on



" ターミナルの右端で文字を折り返さない
set nowrap

" tempファイルを作らない
set noswapfile

" ハイライトサーチ有効
set hlsearch

" 大文字小文字を区別しない(検索時)
set ignorecase

" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase

" カーソル位置が右下に表示される
set ruler

" 行番号を付ける
set number

" コマンドライン補完が強力になる
set wildmenu

" コマンドを画面の最下部に表示する
set showcmd

" クリップボードを共有する
set clipboard=unnamed

" 改行時にインデントを引き継いで改行する
set autoindent

" インデントにつかわれる空白の数
set shiftwidth=4

" <Tab>押下時の空白数
set softtabstop=4

" <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set expandtab

" <Tab>が対応する空白の数
set tabstop=4

" インクリメント、デクリメントを16進数にする
" (0x0とかにしなければ10進数.007をインクリメントすると010になるのはデフォルト設定が8進数のため)
set nf=hex

" マウス設定
set mouse=a

" [ 押下時、 [] 入力、その際括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>
imap < <><left>

" ２回esc を押したら検索のハイライトを止める
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" }}}


if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif



set smartindent

set clipboard+=unnamed


"compatibleオプションの無効化を行う {{{
"Vim をなるべくVi互換にするためのオプションであるため、無効化をしておく必要がある

if &compatible
  set nocompatible
endif

"}}}


"画面が点滅するのを制御する {{{

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"}}}



"カーソルが行の最後に移動してもフラッシュが表示されなくなる
set noshowmode


"ヘルプの日本語化
set helplang=ja


"undoファイルの保存先
set undodir=C:\Users\pc\Documents\undofiles



""" Backup file settings (file.txt~)
set backup
set backupdir=~/temp/vim_backup




if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif


"マルチバイト文字対応
set ambiwidth=double


"file encoding
set encoding=utf-8 "内部処理に使用するエンコーディング
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis "現在開いているファイルのエンコーディング
set fileformats=dos,unix,mac "ファイルを開く時に適用するエンコーディング(値は複数指定可能)


"backspace設定
set backspace=indent,eol,start


" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}


" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}


" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}


" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}


" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}




" previm/previmの設定
"let g:previm_open_cmd = 'previm --port 8080 --browser google-chrome'  " ブラウザとポートを指定

"let g:previm_open_cmd = 'open -a Google\ Chrome'

"let g:previm_open_cmd = 'C:\\Program\ Files\ (x86)\\Google\\Chrome\\Application\\chrome.exe'
"let g:previm_enable_realtime = 1

"let g:previm_open_cmd = 'start chrome --app=%s'

"以下を記載して、file://指定でindex.htmlを表示したら見れた。
"let g:previm_open_cmd = 'start chrome.exe --app=%s'

"以下を記載して、file://指定でindex.htmlを表示したら見れた。2
"let g:previm_open_cmd = 'start chrome.exe file://%s'
"let g:previm_browser = 'chrome'



"let g:previm_open_cmd = 'python -m webbrowser http://localhost:8000/C:/Users/pc/Desktop/test.md'
"let g:previm_open_cmd = 'python -m webbrowser http://localhost:8000/index.html'
let g:previm_open_cmd = 'python -m webbrowser http://localhost:8000/test.md'
let g:previm_browser_cmd = 'C:/Program Files (x86)/Google/Chrome/Application/chrome.exe'
let g:previm_enable_default_mappings = 0





"let g:previm_open_cmd = 'http://localhost:8000'

" Markdownファイルを編集しているときに自動的にプレビューを開始
"autocmd FileType markdown PrevimOpen



"skk.vim設定
set runtimepath+=C:\Users\pc\vimfiles
filetype plugin on


" カラースキーム
" (dein側のインストール処理をこれの前に書いているから、ここで設定を書く必要があった)
"colorscheme jellybeans
"colorscheme desert

"colorscheme kanagawa
"このvimのバージョンでは利用できないらしい（ポップアップがでた）

set termguicolors
" $TERMがxterm以外のときは以下を設定する必要がある。
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " 文字色
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " 背景色

colorscheme nord

set runtimepath+=~/.fzf



"markdown設定 {{{
"URLの設定
vnoremap <leader>mdu ygvs[](<c-r>"<BS>)<esc>?[]<cr>a

"シンタックスハイライトの設定(errorがでているので、別途調査すること)
"恐らく、vimのデフォルトのシンタックスハイライトの設定と競合しているのだと思われる。


"let g:markdown_fenced_languages = [
""   \'coffee',
"   \'c',
"   \'css',
"   \'erb=eruby',
"   \'javascript',
"   \'js=javascript',
"   \'json=javascript',
"   \'ruby',
"   \'sass',
"   \'xml',
"   ]

"}}}


" Denopsのバージョンチェックを無効化
let g:denops_disable_version_check = 1


" font設定
".vimrcからgVimを.gvimrcを使用せずに設定している
if has('gui_running')
    " 半角文字
    set guifont=Cica:h12
    " 全角文字
    set guifontwide=Cica:h12
endif


"lightline.vimの設定
set laststatus=2




let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction




" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
