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
" タブ表示幅
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
