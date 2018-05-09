libraries
setter
  "setter for generalized set!	
	from http://srfi.schemers.org/srfi-17/srfi-17-twobit.scm"

  "(unspecified)"

  ^ #(#'in' #'-' #'library' #'setter' #(#'define' #'setter' #(#'let' #(#(#'setters' #(#'list' #(#'cons' #'car' #'set' #'-' #'car' #'!') #(#'cons' #'cdr' #'set' #'-' #'cdr' #'!') #(#'cons' #'caar' #(#'lambda' #(#'p' #'v') #(#'set' #'-' #'car' #'!' #(#'car' #'p') #'v'))) #(#'cons' #'cadr' #(#'lambda' #(#'p' #'v') #(#'set' #'-' #'car' #'!' #(#'cdr' #'p') #'v'))) #(#'cons' #'cdar' #(#'lambda' #(#'p' #'v') #(#'set' #'-' #'cdr' #'!' #(#'car' #'p') #'v'))) #(#'cons' #'cddr' #(#'lambda' #(#'p' #'v') #(#'set' #'-' #'cdr' #'!' #(#'cdr' #'p') #'v'))) #(#'cons' #'vector' #'-' #'ref' #'vector' #'-' #'set' #'!') #(#'cons' #'string' #'-' #'ref' #'string' #'-' #'set' #'!')))) #(#'letrec' #(#(#'setter' #(#'lambda' #(#'proc') #(#'let' #(#(#'probe' #(#'assv' #'proc' #'setters'))) #(#'if' #'probe' #(#'cdr' #'probe') #(#'error' 'No setter for ' #'proc'))))) #(#'set' #'-' #'setter' #'!' #(#'lambda' #(#'proc' #'setter') #(#'set' #'!' #'setters' #(#'cons' #(#'cons' #'proc' #'setter') #'setters'))))) #(#'set' #'-' #'setter' #'!' #'setter' #'set' #'-' #'setter' #'!') #'setter'))))