cache access
atURL: aURLString
	"Answer the page corresponding to this URL. Evaluate the given block if there is no entry for the given URL."

	
	^ PageCache at: aURLString ifAbsent: [ | pg |
		pg := SqueakPage new.
		"stamp := Utilities authorInitialsPerSe ifNil: ['*']."
		"pg author: stamp."
		"Need to deal with inst vars if we turn out to be new!"
		"pg url: aURLString. 	done by atURL:put:"
		self atURL: aURLString put: pg.
		pg]
