" An example for a .vimrc file

"version 5.0		" avoid warning for wrong version

set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
set tw=78		" always limit the width of text to 78
"set backup		" keep a backup file
set nobackup		" don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers

"
" DB2 compatable spacing (I always liked tabs myself, but that
" makes the code too much of a mess when used inconsistently).
"
set et			" expand tabs to spaces.
set shiftwidth=3        " for >> indenting
set tabstop=3           " the amount of space a tab moves.

"
" miscellaneious options:
"
set nowrap            "do not wrap lines
set makeprg=gnumake
set fileformat=unix
set title
set noerrorbells
"set incsearch
set number             " for line numbers
"set ruler
"set nottyfast          " redraws less.
set nocompatible

"I was shown an useful VIM option this morning.  Adding...
"
set listchars=tab:>-,trail:<
set list
"
"... to your .vimrc displays any <tab> characters as '>', and the
"resulting whitespace as a series of '-' characters.  The 'trail' option
"then displays any trailing whitespace at the end of a line with '<'
"characters.

if &term == "aixterm"
   set term=ansi
endif

syntax on

"%!grep File  | sed 's/.*File //;s/ .*//' | sort

" reverse x == y order (for assignment protection trick):
",/^}/ s/( *\([^()= ]\+\) *\([!=]\)= *\([^) ]\+\) *)/(\3 \2= \1)/cg
",$ s/\([^ ]\); /\1 ;/cg
",$ s/\([^ ]\);/\1 ;/cg

" For normalizing ifdef's :
",$ s/ifdef/if defined/cg
",$ s/ifdef \([^ ]\+\)     /if defined \1/cg
"%s/defined *(\([^)]\+\) *)/defined \1/cg
"/defined.*[()]

" move the * in a pointer arg closer to the type: x    * y -> x *    y
"%s,  \(  \+\)\*\([^/]\), *\1 \2,c

" For manipulation of changelog headers
":,/^\*/-3 s,/9,/199,c
":r /afs/tor/u/pjoot/misc/changelog.src
":r /afs/tor/u/pjoot/misc/prologue.src
":,/^\*/-3 s,^\( \+[0-9]*\) \+\(.../..\)/9\(.\)  \(...\) \+, \1 \2/199\3 \4 ,
":,/^\*/-3 s,^\( [0-9]*\) \+\(.../..\)/9\(.\)  \(...\) \+, \1 \2/199\3 \4 ,
":2, s/^./ /
":,/^\*/-3 s, *[d@f]*[0-9]\+[a-z,A-Z]\+ *$,,c
":,/^\*/-3 s,\(..\)/\(...\)/\(..\) \(.....\),\4 \2/\1/19\3,
":,/^\*/-3 s,\(..\)/\(...\)/\(..\),\2/\1/19\3,
":,/^\*/-3 s,^\( \+\)0,\1 ,
",/^\*/-3 s/\(.*\)@\(.*\)/\2 \1/c

" sqp changelog manipulation:
",/Last Changed/-2 s, \+\(..\)[-/]\(...\)[-/]9\(.\) \+, \2/\1/199\3 ,
",/Last Changed/-2 s, \+\(..\)[-/]\(...\)[-/]0\(.\) \+, \2/\1/200\3 ,
",/Last Changed/-2 s,@.*,,
",/Last Changed/-2 s, \+\(..\)[-/]\(...\)[-/]9\(.\) \+\([^@]\+\)@d*[0-9]*\([^ $]\+\), \2/\1/199\3 \5 \4,
",/Last Changed/-2 s, \+\(..\)[-/]\(...\)[-/]0\(.\) \+\([^@]\+\)@d*[0-9]*\([^ $]\+\), \2/\1/200\3 \5 \4,
",/Last Changed/-2 s, \+\(...\)[-/]\(..\)[-/]0\(.\) \+\([^@]\+\)@d*[0-9]*\([^ $]\+\), \1/\2/200\3 \5 \4,
"

" Misc:
":%s/ \+$//
":%s,/\*\+[^\*]*\*\+/,,
":%s,/\*\+[^\*]*,,
":%s,//.*,,
" 11 chars + 12 chars -> \1
":%s/\(.\{,11\}\).\{,12}/\1/
"%s/"[^"]*"//c

" For the bit long purge for 64 bit:
"map <F5> :%s/\<unsigned\( \+\)long\>\( \)\+int/sqluint32      \1\2/cg
"map <F6> :%s/\<unsigned\( \+\)long\>/sqluint32   \1/cg
"map <F7> :%s/\<signed\( \+\)long\>\( \)\+int/sqlint32     \1\2/cg
"map <F8> :%s/\<signed\( \+\)long\>/sqlint32  \1/cg
"map <F9> :%s/\<long\>    \( \+\)/sqlint32\1/cg
"map <F10> :%s/\<long\>/sqlint32/cg
"":%s/long[a-zA-Z_]//g
":%s/long[a-z,A-Z,_]//g
"":%s/[a-z,A-Z,_]long//g
":%s/[a-zA-Z_]long//g

"search for bad aliasing constructs:
"/( *[^\*]\+\* *) *&

" change $NAME -> ${NAME?} in shell scripts:
",$ s,\$\([^ ?/{\.!;]\+\),${\1?},cg

":%s/sqlofblk *( *[^,][^,]* *, *[^,][^,]* *, */sqlofmblk(/cg
":%s/( *void *) *sqlofblk *( *[^,][^,]* *, *[^,][^,]* *, */sqlofmblk(/cg
":%s/= *sqlofblk *( *[^,][^,]* *, *[^,][^,]* *, */= SQLO_OK ; sqlofmblk(/cg
":%s/sqlofmblk *( *( *void *\* *) */sqlofmblk(/c

":%s/= *sqlofmblk *( *[^,][^,]* *, */= SQLO_OK ; sqlofmblk(/cg

"%s/SQLO_INCR *( *\([^,]\+\) *, *\([^,]\+\) *,\([^)]\+\) *)/\2 = sqloAtomicIncrement(\1, \3)/c
"%s/SQLO_DECR *( *\([^,]\+\) *, *\([^,]\+\) *,\([^)]\+\) *)/\2 = sqloAtomicDecrement(\1, \3)/c
"%s/\(sqloAtomic.*,\)  \+/\1 /c

"/[^=!]= *SQLO_INVALID_FH
"/\(\<.*\>\) *!= *SQLO_INVALID_FH
"%s/(\(.*\) *!= *SQLO_INVALID_FH)/(sqloIsValidFh(\1))/c
"%s/(\(.*\) *== *SQLO_INVALID_FH)/(sqloIsInvalidFh(\1))/c
"%s/(\([^(]\+\) *== *SQLO_INVALID_FH)/(sqloIsInvalidFh(\1))/c
"%s/(\([^(]\+\) *!= *SQLO_INVALID_FH)/(sqloIsValidFh(\1))/cg
"%s/\([^ 	]\+\) *= *SQLO_INVALID_FH/sqloInvalidateFh(\&\1)/c
" this one is good:
"%s/\(\<[^ (|&]\+\>\) *!= *SQLO_INVALID_FH/sqloIsValidFh(\1)/cg
"%s/sqloInvalidateFh(&\*/sqloInvalidateFh(/

ab _pj @dyyyyyypj
ab _e %E%  %U%
ab _w %W%)

"ab _t SQLTFLAGS SQLT_EVENTS = sqltevents;
"ab _i if (sqltevents)
ab _p @d254067pj
ab _d 254067
"ab _r SQLD_RID

ab _c 254067 28/Dec/00 pj  remove sqloprtf; split OSS stream IO from sqlofm.h
"ab _c 254067   99/07/06 pj  64BIT: format specifer modifications
"ab _c 254067 Jun/14/1999 pj
"ab _c 64 bit: fix up file pointer offset arguments

"function D0()
""  echohl WarningMsg | echo "D0" | echohl None
"   r! date +"\%b/\%d/\%Y pj"
"" append this to the last line (without adding space)
"   -1 join!
"" go back to our line, how do we go into insert mode
"   +1 insert
"endfunction
""cmap d0 call D0()
"
"function D1()
"   r! date +"\%b/\%d/\%y pj"
"   -1 join!
"   +1 insert
"endfunction
""cmap d1 call D1()
"
"function Fd()
"   %s,/[^/]*$,,
"   %!sort -u
"endfunction
"
"%b     locale's abbreviated month name (Jan..Dec)
"%d     day of month (01..31)
"%D     date (mm/dd/yy)
"%m     month (01..12)
"%y     last two digits of year (00..99)
"%Y     year (1970...)

"map <F2> :!Spresto `dirname %` ; presto % `dirname %`/S/`basename %`<CR>
"map <F2> :!spresto %

"map <F3> oSQLTFLAGS SQLT_EVENTS = sqltevents;
"map <F3> oVA36_NO_IPA
"map <F3> oSQLT_LOCAL_EVENTS
"map <F3> o#include <stdlib.h>
"map <F3> o#include
"map <F3> o#ifdef __cplusplus
"map <F4> RSQLTFLAGS
"map <F4> oif (SQLT_EVENTS)
map <F4> :set noautoindent nocindent formatoptions=<CR>

"map <F5> 2cwsqlo_waitpost_code
"map <F6> cwsqlo_waitpost_code
"map <F7> Rsqlo_waitpost_code

"map <F5> :%s/\([^( ]\+\) *== *\<SQLO_NOMEM[^) ]*\>/sqloNoMemoryError(\1)/c
"map <F6> :%s/( *\([^( ]\+\) *& *SQLO_NOMEM[^) ]* *) *== *\<SQLO_NOMEM[^) ]*\>/sqloNoMemoryError(\1)/c
"map <F7> :%s/\([^( ]\+\) *!= *\<SQLO_NOMEM[^) ]*\>/! sqloNoMemoryError(\1)/c

"map <F5> :%s,S/,,<CR>
"map <F5> oSQLT_DECL_LOCAL_EVENTS
"map <F5> cwSQLT_EVENTS
"map <F6> :%s,/[^/]*$,/S&,<CR>
"map <F7> :!touch -t 01010000 %<CR>
"map <F8> :call Fd()
"map <F9> o#endif
"map <F10> o#ifndef HACK64 // FIXME: this code is broken for 64 bit:


" Some interesting vim macros from Kelly's vimrc
let @m = 77
" Add a line of ='s:
"==============================================================================
"map <F2>  o<Esc>:let @p=@m+2-col(".")<CR>:if @p<1<CR>:let @p=1<CR>:endif<CR>@pA=<Esc>0WW

" Add a line of -'s:
" ------------------------------------------------------------------------------
"map <F3>  o<Esc>A <Esc>:let @p=@m+2-col(".")<CR>:if @p<1<CR>:let @p=1<CR>:endif<CR>@pA-<Esc>0WW

" print out the date in an undesirable format: 2002Jan30
"map <F4>  :let @k=strftime("%Y%b%d", localtime())<CR>o<ESC>A <ESC>"kpA <ESC>"spA  <ESC>"ipA 

" put a '@' character in column 80.
"map <F5>  :let @k=col(".")-1<CR>$:let @p=@m+2-col(".")<CR>:if @p<1<CR>:let @p=1<CR>:endif<CR>@pA <Esc>A@<Esc>"sp<ESC>"ip<Esc>0@kl

" put a '//@' with the @ in column 80.
"map <F6>  :let @k=col(".")-1<CR>$:let @p=@m-col(".")<CR>:if @p<1<CR>:let @p=1<CR>:endif<CR>@pA <Esc>A//@<Esc>"sp<ESC>"ip<Esc>0@kl

" also: put a '//@' with the @ in column 80. (expects something in "register s"? )
"map <F7>  :let @k=col(".")-1<CR>$:let @p=@m-col(".")<CR>:if @p<1<CR>:let @p=1<CR>:endif<CR>@pA <Esc>A//@<Esc>"sp<ESC>"ip<Esc>Blllab<Esc>0@kl

" also: put a '//@' with the @ in column 80. (expects something in "register s"? )
"map <F8>  :let @k=col(".")-1<CR>$:let @p=@m-col(".")<CR>:if @p<1<CR>:let @p=1<CR>:endif<CR>@pA <Esc>A//@<Esc>"sp<ESC>"ip<Esc>Blllae<Esc>0@kl

"map <F9>  o{<Esc>ostatic int zzz=1;<Esc>owhile (zzz);<Esc>o}<Esc>o<Esc>

" filters through an align script (line 1 to current line?)
"map <F10> :let @l=line(".")<CR>:1,$!align<CR>:@l<CR>

" use cntl-V<tab> for a real tab
set textwidth=0
"set textwidth=78       " default

" When starting to edit a file:
"   For *.c and *.h files set formatting of comments and set C-indenting on
"   For other files switch it off
"   Don't change the sequence, it's important that the line with * comes first.
autocmd BufRead * set formatoptions=tcql nocindent comments&

autocmd BufRead *.c set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.hpp set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.cpp set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.C set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.cxx set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.sqx set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.SQX set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://

" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
"autocmd BufReadPre,FileReadPre      *.gz set bin
"autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
"autocmd BufReadPost,FileReadPost    *.gz set nobin

"autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
"autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

"autocmd FileAppendPre		    *.gz !gunzip <afile>
"autocmd FileAppendPre		    *.gz !mv <afile>:r <afile>
"autocmd FileAppendPost		    *.gz !mv <afile> <afile>:r
"autocmd FileAppendPost		    *.gz !gzip <afile>:r

"There are two methods to enter digraphs:                        *i_digraph*
"        CTRL-K {char1} {char2}          or
"                {char1} <BS> {char2}
" 
"
" CTRL-K ae : æ 
"        c, : ç 
" a^ : â
" y' : ý 
" a" : ä 
" :dig shows all the diagraphs.

" For Sam's vim plug in for db2 trace files:
" http://w3.torolab.ibm.com/~oosterhu/vim/
if version >= 600
   filetype plugin on
endif
"" get rid of end of line white space
"au BufWritePre *.sq*,*.C,*.c,*.h  %s/\s\+$//e



" Added by Mihai Nicolae. "

" === Appearance ===
set background=dark
colorscheme torte

" === Search ===
set hlsearch " highlight search results

" === Other ===
set cpoptions+=$ " add the '$' sign as change command indicator
