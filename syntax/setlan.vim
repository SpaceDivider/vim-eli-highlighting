" Vim syntax file
" Language:	SetLan-Config
" Maintainer:	SK
" Last Change:	2013 Oct 21

if exists("b:current_syntax")
  finish
endif

syn case ignore

" The SetLan reserved strings:

syn keyword slType set int bool
syn keyword slPrimStatement printLn printSpace
syn keyword slConditionKeyword if then else 
syn keyword slStmtKeyword if then else print read foreach of while do 
syn keyword slCmpOperator < <= == != >= > in
syn keyword slArithOperator + - * / \% 
syn keyword slLogicOperator \|\| &&
syn keyword slAssignOperator =
syn keyword slUnOperator - !
syn keyword slSetKeyword of in contained

" If, While, Foreach
syn region slIf start=+if+ end=+then+ contains=slCondition skipwhite
syn region slFor start=+foreach+ end=+do+ contains=slCondition skipwhite
syn region slWhile start=+while+ end=+do+ contains=slCondition skipwhite
syn match slCondition ".+" contained contains=slCmpOperator,slLiteral transparent

" Block:
syn region slBlock start=+{+ end=+}+ contains=ALL

" Sets:
syn region slSet start=+\[+ end=+\]+ contains=ALLBUT,slStmtKeyword,slType


" Clusters:
syn cluster slLiteral contains=slNumber,slIdent

" Numbers:
syn match slNumber "-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region slComment start="/\*"  end="\*/" 

syn sync ccomment slComment

" Define the default highlighting.
if version >= 508 || !exists("did_eli_syn_inits")
  if version < 508
    let did_eli_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink slComment		Comment
  HiLink slAssignOperator	slOperator
  HiLink slCmpOperator		slOperator
  HiLink slArithOperator	slOperator
  HiLink slLogicOperator	slOperator
  HiLink slUnOperator		slOperator
  HiLink slPrimStatement	slStatement
  HiLink slStmtKeyword		slStatement
  HiLink slNumber		Number

  HiLink slConditionKeyword	Condition
  HiLink slSet				Structure
  HiLink slSetKeyword  	Special
  HiLink slOperator		Operator	
  HiLink slStatement		Statement
  HiLink slType			Type
  delcommand HiLink
endif

let b:current_syntax = "setlan"
