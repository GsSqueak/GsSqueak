initialization
calculateColumnWidthsFrom: arrayOfMorphs 
	| maxWidths |
	maxWidths := Array new: arrayOfMorphs size - 1.
	1
		to: maxWidths size
		do: [:idx | maxWidths at: idx put: 0].
	1
		to: maxWidths size
		do: [:idx | (arrayOfMorphs at: idx)
				do: [:mitem | mitem width
							> (maxWidths at: idx)
						ifTrue: [maxWidths at: idx put: mitem width]]].
	^maxWidths