LISP-primitives
error: aConsCell 
	"(error STRING ...)
	Raise a LispError with text STRING"
	self
		lispError: (String
				streamContents: [:str | 
					str nextPutAll: aConsCell car.
					aConsCell cdr
						ifNotNil: [aConsCell cdr
								do: [:ea | 
									str cr.
									ea printOn: str forLisp: self]]])
