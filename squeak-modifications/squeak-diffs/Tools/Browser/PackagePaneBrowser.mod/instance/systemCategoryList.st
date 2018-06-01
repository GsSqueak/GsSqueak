system category list
systemCategoryList
	"Answer the sequenceable collection containing the class categories that 
	the receiver accesses."

	| prefix |
	packageListIndex = 0 ifTrue: [^ systemOrganizer categories].
	prefix := self package, '-'.
	^ Array streamContents:
		[:strm |
		systemOrganizer categories do: 
			[ :cat | (cat beginsWith: prefix) ifTrue:
				[strm nextPut: (cat copyFrom: prefix size + 1 to: cat size)]]]