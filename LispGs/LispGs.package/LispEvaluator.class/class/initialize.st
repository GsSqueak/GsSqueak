private
initialize
	"LispKernel initialize"
	Sugar := Dictionary
				with: $' -> #quote
				with: #'`' -> #quasiquote
				with: #, -> #unquote
				with: #,@ -> #'unquote-splicing'.
	Sugar add: #'#`' -> #function:.
	self compilePrimitiveLists
