function! SetLanFolds()
	if getline(v:lnum) =~? '\v\{.*'
		return 'a1'
	elseif getline(v:lnum) =~? '\v\}'
		return 's1'
	else
		return '='
	endif

endfunction
setlocal foldmethod=expr
setlocal foldexpr=SetLanFolds()
setlocal foldlevel=5
