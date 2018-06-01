table defaults
stringWithLayout
	| _gsSqueakTemp_defaultValues _gsSqueakTemp_uniqueValues |
	_gsSqueakTemp_defaultValues := TableLayoutProperties new.
	_gsSqueakTemp_uniqueValues := self class allInstVarNames
				select: [:title | (self instVarNamed: title)
						~= (_gsSqueakTemp_defaultValues instVarNamed: title)].
	^ String
		streamContents: [:aStream | 
			aStream nextPutAll: 'TableLayout new; '.
			_gsSqueakTemp_uniqueValues
				do: [:title | 
					aStream nextPutAll: title;
						 nextPut: $:;
						 space;
						
						print: (self instVarNamed: title).
					title = _gsSqueakTemp_uniqueValues last
						ifTrue: [aStream nextPut: $.]
						ifFalse: [aStream nextPut: $;;
								 cr]]]