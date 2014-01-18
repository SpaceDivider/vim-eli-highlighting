function! EliFolds()
	if getline(v:lnum) =~? '\v^\s*$'
		return '-1'
	" Standard cases
	elseif getline(v:lnum) =~? '\v^\~O.*'
		return '>1'
	elseif getline(v:lnum) =~? '\v^\~\$.*'
		return '>1'
	elseif getline(v:lnum) =~? '\v^\~\}'
		return '<1'
	else
		return '='
	endif
endfunction
function! EliFoldText()
	let line = getline(v:foldstart)
	let size = v:foldend - v:foldstart
	let sub = substitute(line, '^\~\|\~<\|\~>\|==\|\~{\~', '', 'g')
	let sub = substitute(sub, '\$', '\[Part\] ', 'g')
	let sub = substitute(sub, '^O', '\[Command\] ', 'g')
	return v:folddashes . sub ."---- ". size . " Zeilen"
endfunction

setlocal foldmethod=expr
setlocal foldlevel=1
setlocal foldexpr=EliFolds()
setlocal foldtext=EliFoldText()
