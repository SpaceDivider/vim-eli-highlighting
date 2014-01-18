" Vim syntax file
" Language:	ELI-Config
" Maintainer:	SK
" Last Change:	2013 Oct 20

if exists("b:current_syntax")
  finish
endif

syn case ignore

" The ELI reserved strings:
syn keyword eliSpecial  ATTR CHAIN VOID RULE COMPUTE END CHAINSTART contained
syn keyword eliConstant int contained
syn keyword eliFunction ADD contained
syn keyword eliVariable LINE COL contained
syn match eliOperators 	"/\|\.\s*$\|,\|;\|:\|\[\|\]\|(\|)\|=" contained

" Strings and characters:
syn region eliString		start=+"+  skip=+\\\\\|\\"+  end=+"+ contained
syn match eliString 		"'.\{-}'" contained
syn match eliTermDef		"^\a\+:" contained
syn match eliRuleDef		"\a\+\s\+::=.\+" contains=eliSpecial,eliString,eliOperators

" Numbers:
syn match eliNumber		"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn match eliComment		"\~!.*$" contains=eliTodo
syn region eliComment    	start="/\*"  end="\*/" contains=eliTodo
syn match eliComment		"--.*$" contains=eliTodo

syn sync ccomment eliComment

" Blocks
syn match eliConfigLine 	"^@=\~\|^\~[ip].*"
syn match eliBlockTitle		"\(<\)\@<=.\{-}\(\~>\)\@=" contained
syn region eliBlock 		start="\~O\~<.*\~>\~{\~-" end="\~}$" contains=ALL
syn region eliBlock 		start="\~\$\~<.*\~>==\~{\~-" end="\~}$" contains=ALL

" Error cases:


" Define the default highlighting.
if version >= 508 || !exists("did_eli_syn_inits")
  if version < 508
    let did_eli_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink eliBlock	eliStatement
  HiLink eliConfigLine	eliStatement
  HiLink eliTermDef	eliType
  HiLink eliRuleDef	eliType
  HiLink eliBlockTitle	eliIdent
  HiLink eliVariable	eliIdent


  HiLink eliComment	Comment
  HiLink eliOperators	Operator
  HiLink eliSpecial	Special	
  HiLink eliStatement	Statement
  HiLink eliConstant	Constant
  HiLink eliNumber	Number
  HiLink eliString	String
  HiLink eliIdent	Identifier
  HiLink eliFunction	Function
  HiLink eliType	Type
  HiLink eliTodo	Todo
  HiLink eliAggregate	PreProc
  delcommand HiLink
endif

let b:current_syntax = "eli"
