initialization
createMorphicListsFrom: arrayOfLists 
	| array |

	array := Array new: arrayOfLists size.
	1 to: arrayOfLists size do: [:arrayIndex |
		array at: arrayIndex put: (
			(arrayOfLists at: arrayIndex) collect: [:item | item isText
						ifTrue: [StringMorph
								contents: item
								font: self font
								emphasis: (item emphasisAt: 1)]
						ifFalse: [StringMorph contents: item font: self font]])
		].
	^array