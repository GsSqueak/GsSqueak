translation support
sizeof: objectSymbolOrClass 
	| _gsSqueakTemp_index |
	objectSymbolOrClass isInteger
		ifTrue: [^ self class objectMemoryClass wordSize].
	(#(#usqInt #sqInt) includes: objectSymbolOrClass)
		ifTrue: [^ self class objectMemoryClass bytesPerOop].
	objectSymbolOrClass isSymbol
		ifTrue: [(objectSymbolOrClass last == $*
					or: [#(#long #'unsigned long' #'sqIntptr_t' #'usqIntptr_t' #'size_t') includes: objectSymbolOrClass])
				ifTrue: [^ self class objectMemoryClass wordSize].
			_gsSqueakTemp_index := #(#sqLong #usqLong #double #int #'unsigned int' #float #short #'unsigned short' #char #'unsigned char' #'signed char')
						indexOf: objectSymbolOrClass
						ifAbsent: [self error: 'unrecognized C type name'].
			^ #(8 8 8 4 4 4 2 2 1 1 1) at: _gsSqueakTemp_index].
	^ (objectSymbolOrClass isBehavior
		ifTrue: [objectSymbolOrClass]
		ifFalse: [objectSymbolOrClass class])
		alignedByteSizeOf: objectSymbolOrClass
		forClient: self