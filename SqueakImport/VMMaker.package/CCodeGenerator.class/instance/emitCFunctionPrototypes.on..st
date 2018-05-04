C code generator
emitCFunctionPrototypes: methodList on: aStream 
	"Store prototype declarations for all non-inlined methods on the given stream."
	| exporting |
	aStream nextPutAll: '/*** Function Prototypes ***/'; cr.
	exporting := false.
	methodList do: [:m | 
		m export
			ifTrue: [exporting
					ifFalse: 
						[aStream nextPutAll: '#pragma export on'; cr.
						exporting := true]]
			ifFalse: [exporting
					ifTrue: 
						[aStream nextPutAll: '#pragma export off'; cr.
						exporting := false]].
		m emitCFunctionPrototype: aStream generator: self.
		aStream nextPutAll: ';'; cr].
	exporting ifTrue: [aStream nextPutAll: '#pragma export off'; cr]