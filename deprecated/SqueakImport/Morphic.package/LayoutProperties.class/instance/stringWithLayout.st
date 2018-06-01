table defaults
stringWithLayout
	| defaultValues uniqueValues |
	defaultValues := TableLayoutProperties new.
	uniqueValues := self class allInstVarNames
		select: [:title | (self instVarNamed: title)
					~= (defaultValues instVarNamed: title)].
	^ String
		streamContents: [:aStream | 
			aStream nextPutAll: 'TableLayout new; '.
			uniqueValues
				do: [:title | aStream nextPutAll: title;
						 nextPut: $:;
						 space;
						
						print: (self instVarNamed: title).
						(title = uniqueValues last)
						ifTrue:[ aStream nextPut:$.]
						ifFalse:[ aStream nextPut: $;; cr]
						]]