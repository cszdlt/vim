set ts=4
set sw=4
set smarttab
set history=1000 "历史记录数
set autowrite
"共享剪贴板  
set clipboard+=unnamed
syntax on
set cul "高亮光标所在行
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set t_Co=256
set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
"" 显示行号
set number
"禁止备份
set nobackup
set noswapfile
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
""搜索忽略大小写
""set ignorecase
""set linespace=0
"" 增强模式中的命令行自动完成操作
set wildmenu
"" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
"" 允许backspace和光标键跨越行边界
set whichwrap+=b,s,h,l<,>,~,[,]
"
"" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
"" 通过使用: commands命令，告诉我们文件的哪一行被改变过
"set report=0
"" 在被分割的窗口间显示空白，便于阅读
""set fillchars=vert:\ ,stl:\ ,stlnc:\
"" 高亮显示匹配的括号
set showmatch
"" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
"" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shift tab pages
imap <F5> <ESC>:w<cr>
map <F5> :w<cr>
map <S-Left> <Esc>vh
map <S-Right> <Esc>vl
map <S-Up> <Esc>vk
map <S-Down> <Esc>vj
map <C-A> ggVG
imap <C-A> <esc>ggVG
map <A-Left> :tabp<CR><F3>
imap <A-Left> <Esc>:tabp<CR><F3>
map <A-Right> :tabn<CR><F3>
imap <A-Right> <Esc>:tabn<CR><F3>
imap <S-Left> <Esc>vh
imap <S-Right> <Esc>vl
imap <S-Up> <Esc>vk
imap <S-Down> <Esc>vj
imap <C-p> <BS>
map <C-x> <Home>
map <C-n> <End>
imap <C-x> <Home>
imap <C-n> <End>
"inoremap <C-p> <c-x><c-o>
noremap <C-b> <Esc><C-v>
inoremap <C-b> <Esc><C-v>
" 选中状态下 Ctrl+c 复制
vmap <C-c> y

inoremap <C-V> <esc>"*p
noremap <C-V> "*p

omap e a{
imap <C-o> <End><CR>
imap <C-up> <esc>ddkPi
map <C-up> <esc>ddkPi
imap <C-down> <esc>ddpi
map <C-down> <esc>ddpi
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"

"C，C++ 按F9编译运行
map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif


"Ctags 
"map <F2> :TlistToggle<CR>
"imap <F2> <Esc>:TlistToggle<CR>
"let Tlist_Show_One_File=1    " 只展示一个文件的taglist
"let Tlist_Exit_OnlyWindow=1  " 当taglist是最后以个窗口时自动退出
"let Tlist_Use_Right_Window=1 " 在右边显示taglist窗口
"let Tlist_Sort_Type="name"   " tag按名字排序
"let Tlist_WinWidth=20

"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"set tags+=./tags "add current directory's generated tags file
"set tags+=~/.vim/cpp_src/tags
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1 
"let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
"let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
"let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
"let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
"set completeopt=menuone,menu,longest



"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" 显示行号
 let NERDTreeShowLineNumbers=1
 let NERDTreeAutoCenter=1
"" 是否显示隐藏文件
 let NERDTreeShowHidden=1
"" 设置宽度
 let NERDTreeWinSize=21
"" 在终端启动vim时，共享NERDTree
 let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']



filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

""底部状态栏
Plugin 'Lokaltog/vim-powerline'

"文件目录
Plugin 'scrooloose/nerdtree'

"括号
Plugin 'Raimondi/delimitMate'
call vundle#end()            " required
filetype on


nmap <F12> :source ~/.vimrc<CR>
"自动补齐

"inoremap ( <c-r>=AutoPair('(',')')<CR>
"inoremap [ <c-r>=AutoPair('[',']')<CR>
"inoremap { <c-r>=Haha()<CR>
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap " <c-r>=Maohao('"')<CR>
"inoremap ' <c-r>=Maohao("'")<CR>

function! Haha()
    let ch=getline('.')[col('.')-1]
    if col('.')==col('$')||ch==' '
        return "{\<CR>}\<Esc>O"
    else
        return "{"
    endif
endf

function! Pd(char)
    if a:char==')'||a:char=='}'||a:char==']'||a:char=='"'||a:char=="'"
        return 't'
    else 
        return 'f'
    endif
endf

function! ClosePair(char)
    let line=getline('.')
   if line[col('.')-1]==a:char
	 return "\<Right>"
    else 
	 return a:char
    endif
endf

function! Maohao(char)
    let ch=getline('.')[col('.')-1]
    if ch==a:char
        return "\<Right>"
    elseif col('.')>strlen(getline('.'))||ch==' '||ch==')'||ch==']'||(ch=='"'&&a:char=="'")||(ch=="'"&&a:char=='"')
        return a:char.a:char."\<Esc>i"
    else 
        return a:char
    endif
endf

function! AutoPair(open, close)
  let line = getline('.')
  if col('.') > strlen(line) || line[col('.') - 1] == ' '||Pd(line[col('.')-1])=='t'
    return a:open.a:close."\<ESC>i"
  else
    return a:open
  endif
endf


inoremap <C-D> <Esc><C-d>i
inoremap <C-U> <Esc><C-u>i
inoremap <C-h> <c-r>=Ahaha('h')<CR>
inoremap <C-j> <c-r>=Ahaha('j')<CR>
inoremap <C-k> <c-r>=Ahaha('k')<CR>
inoremap <C-l> <c-r>=Ahaha('l')<CR>

inoremap <home> <c-r>=Home()<CR>

function! Home()
	let l=col('.')
	let line=getline('.')
    if (l>=3&&line[l - 2]==' '&&line[l - 3]==' ')||line[l-2]=="	"
        return "\<home>"
    else 
        return "\<esc>\<home>^i"
    endif
endf


function! Ahaha(char)
    let ans="\<Esc>".a:char
    if col('.')==1
        if a:char=='h'
            return ans."a"
        else
            return ans."i"
        endif
    endif
    if strlen(getline('.'))<col('.')
        if a:char=='l'
           return ans."i"
        elseif a:char=='h'
            return "\<Esc>i"
        else
            return ans."a"
        endif
    endif
    if a:char=='h'
        return "\<Esc>i"
    else 
        return ans."a"
    endif
endf


inoremap <C-\> <c-r>=Zhushi()<CR>
noremap <C-\>  i<C-R>=Zhushi()<CR>
"inoremap <C-/> //

function! Zhushi()
    if getline('.')[0]=='/'&&getline('.')[1]=='/'
        return "\<Home>\<Right>\<Right>\<BS>\<BS>"
    else
        return "\<Home>//"
    endif
endf

