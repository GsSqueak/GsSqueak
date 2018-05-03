generating C code
emitCHeaderOn: aStream generator: aCodeGen
	"Emit a C function header for this method onto the given stream."

	aStream cr.
	self emitCFunctionPrototype: aStream generator: aCodeGen.
	aStream nextPutAll: ' {'; cr.
	locals do: [ :var |
		aStream 
			tab; 
			nextPutAll: (declarations 
				at: var 
				ifAbsent: [ 'sqInt ', var]);
			nextPut: $;; 
			cr].
	locals isEmpty ifFalse: [ aStream cr ].