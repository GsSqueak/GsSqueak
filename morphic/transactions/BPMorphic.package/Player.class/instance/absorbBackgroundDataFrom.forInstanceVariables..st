slots-kernel
absorbBackgroundDataFrom: aLine forInstanceVariables: slotNames 
	"Fill my background fields from the substrings in a tab-delimited line of
	data. At the moment this only really cateres to string-valued items"
	slotNames
		doWithIndex: [:aSlotName :anIndex | aLine
				do: [:aValue | self instVarNamed: aSlotName put: aValue]
				toFieldNumber: anIndex]