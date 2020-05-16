" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('~/.vim')
  let s:toml      = g:rc_dir . '/dein.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0}) 

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


" add vimsetting

"setting系
" スワップファイルを作成しない
set noswapfile
" 文字コードをUTF-8に設定
set fenc=utf-8

" 見た目系
" 行数表示
set number
" カーソル(下線)
set cursorline
" シンタックスハイライト
syntax enable
" 検索ハイライト
set hlsearch
" インクリメントサーチ
set incsearch
" Undoの永続化(~/.vim/undo ディレクトリは事前に作成が必要)
if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif
" インデント
set smartindent
" ステータスライン
set laststatus=2
" 括弧入力時の対応括弧を表示
set showmatch

" タブ系
" Tab文字を半角スペースにする
set expandtab
" タブ表示幅(スペース4つ分)
set tabstop=4
set shiftwidth=4

" マウスの有効化
if has('mouse')
	set mouse=a
	if has('mouse_sgr')
		set ttymouse=sgr
	elseif v:version > 703 || v:vetsion is 703 && has('patch632')
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
endif

" NERDTreeの設定
map <C-n> :NERDTreeToggle<CR>

" vim-closetagの設定
let g:closetag_filenames = '*.html,*.xhtml,*.php,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,php'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
