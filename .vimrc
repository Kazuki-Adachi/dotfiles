"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
set cursorcolumn
set virtualedit=onemore
" インデントが{}, if, forなどに対応
set smartindent
" 折返し時にインデントを維持する
set breakindent
" 前行のインデントを維持する
set autoindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap （ （）<LEFT>
inoremap 「 「」<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap 、 ,\ 
inoremap 。 .\ 
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>
" シンタックスハイライトの有効化
syntax enable
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" クリップボードの連携
set clipboard=unnamedplus
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" im_control.vimにランタイムパスを通す
set runtimepath+=/tmp/im_control.vim-master
" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 1
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" IBus 1.5以降
function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('ibus engine "mozc-jp"')
  elseif cmd == 'Off'
    let res = system('ibus engine "xkb:jp::jpn"')
  endif
  return ''
endfunction
" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
" IMCtrl()のsystem()コマンド実行時に&を付けて非同期で実行するという方法でも体感速度が上がる場合があります。
set timeout timeoutlen=3000 ttimeoutlen=100
" コマンドラインの高さを 2 以上にしておくと切替時に切替後の「日本語入力固定モード」が表示されます。
set cmdheight=2
" 「日本語入力固定モード」がオンの場合、ステータス行にメッセージ表示
set statusline+=%{IMStatus('[日本語固定]')}
"im_control.vimがない環境でも .vimrcを変更しなくて済むように、.vimrc内でダミー関数も定義しておくと良いかもしれません。
" 「日本語入力固定モード」がオンの場合、ステータス行にメッセージ表示
set statusline+=%{IMStatus('[日本語固定]')}
" im_control.vimがない環境でもエラーを出さないためのダミー関数
function! IMStatus(...)
  return ''
endfunction

augroup texfile
  autocmd BufRead,BufNewFile *.tex set filetype=tex
  let md_to_latex  = "pandoc --from=markdown --to=latex"
  autocmd Filetype tex let &formatprg=md_to_latex
augroup END

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kzkadc/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/kzkadc/.cache/dein')
  call dein#begin('/home/kzkadc/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kzkadc/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('preservim/nerdtree')
  call dein#add('vim-latex/vim-latex')



  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

