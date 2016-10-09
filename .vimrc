" this is the bare minimum
let g:dotvim_settings = {}
let g:dotvim_settings.version = 2

" here are some basic customizations, please refer to the top of the vimrc file 
" for all possible options
let g:dotvim_settings.max_column = 120

" by default, language specific plugins are not loaded.  this can be changed with the following:
let g:dotvim_settings.plugin_groups_exclude = ['ruby','python','javascript']

" alternatively, you can set this variable to load exactly what you want
let g:dotvim_settings.plugin_groups = ['core','go','web','editing','navigation','unite','autocomplete','scm','misc']

" finally, load the distribution
source ~/.vim/vimrc

" Access colors present in 256 colorspace
let base16colorspace=256

set background=dark
colorscheme base16-default

" anything defined here are simply overrides
set wildignore+=\*/node_modules/\*
set guifont=Wingdings:h10
let g:unite_prompt=''
if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden -g ""'
endif

" Text Formatting/Layout    {{{
  " javascript {{{2
  au FileType javascript setlocal et sw=2 sts=2 ts=2 ai foldmethod=indent foldlevel=99

  " PHP {{{2
  let php_sql_query=1         " highlight all sql queries
  let php_htmlInStrings=1     " highlight html syntax within strings
  let php_noShortTags=1       " disable short tags
  let php_folding=1           " enable folding for classes and functions
  au FileType php setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
  au BufRead,BufNewFile *.ps1 set ft=ps1

  " Python {{{2
  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType python setlocal et sw=4 sts=4 ts=4 ai foldmethod=indent foldlevel=99

  " Markdown {{{2
  " Don't insert linebreaks in documents, it screws up conversions
  au FileType markdown setlocal tw=0 wrap linebreak nolist wrapmargin=0 ai formatoptions=tcroqn2 comments=n:>

  " Text {{{2
  "au BufRead,BufNewFile *.txt set filetype=txt
  au FileType txt set tw=100 autoindent expandtab formatoptions=taqn

  " Shell {{{2
  au FileType sh set tw=80 autoindent noexpandtab

  " VimWiki {{{2
  au FileType vimwiki set foldlevel=2 foldlevelstart=2
  au FileType vimwiki map <F8> :!ctags -R .<CR>
  au FileType vimwiki let tlist_vimwiki_settings = 'wiki;h:Headers'

  " XML {{{2
  au FileType xml setlocal et sw=2 sts=2 ts=2 ai
  " html {{{2
  let g:html_indent_inctags = "html,body,head,tbody"
  let g:html_indent_script1 = "inc"
  let g:html_indent_style1 = "inc"
  au FileType html setlocal et sw=2 sts=2 ts=2 ai
  " html {{{2
  au FileType css setlocal et sw=2 sts=2 ts=2 ai

  " tex {{{
  au FileType tex setlocal tabstop=2 softtabstop=2 expandtab smarttab shiftwidth=2 autoindent smartindent shiftround
  " Compilation Rules
  let g:Tex_CompileRule_pdf='xelatex -shell-escape -interaction=nonstopmode $*'
  let g:Tex_CompileRule_xelatex='xelatex -interaction=nonstopmode $*'
  let g:Tex_CompileRule_xgnuplot='xelatex -shell-escape -interaction=nonstopmode $*'
  " View rules
  let g:Tex_ViewRule_ps = 'evince'
  let g:Tex_ViewRule_pdf = 'evince'
  " Target formats
  let g:Tex_DefaultTargetFormat = 'pdf'
  " Ignore some warnings
  let g:Tex_IgnoredWarnings="Font""\n"
" }}}

" Mappings:  {{{
  " Hard to type {{{
    imap jj <Esc>
    imap uu _
    imap hh =>
    imap aa @
    imap ç `
    imap ¡¡ ^^
  " }}}

  " movements {{{
  "  " remap arrow keys
  nnoremap <left> :bprev<CR>
  nnoremap <right> :bnext<CR>
  nnoremap <up> :tabnext<CR>
  nnoremap <down> :tabprev<CR>
  nnoremap <C-J> :bnext<CR>
  nnoremap <C-K> :bprev<CR>
  nnoremap <C-L> :tabn<CR>
  nnoremap <C-H> :tabp<CR>
  " Map ++ to save current file
  nnoremap ++ :w <cr>
  " }}}
" }}}

