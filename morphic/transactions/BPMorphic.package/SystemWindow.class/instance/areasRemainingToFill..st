drawing
areasRemainingToFill: aRectangle 
	| _gsSqueakTemp_areas |
	(_gsSqueakTemp_areas := super areasRemainingToFill: aRectangle) isEmpty
		ifTrue: [^ _gsSqueakTemp_areas].
	"Check for special case that this is scrollbar damage"
	((bounds topLeft - (14 @ 0) corner: bounds bottomRight)
			containsRect: aRectangle)
		ifTrue: [paneMorphs
				do: [:p | ((p isKindOf: ScrollPane)
							and: [p scrollBarFills: aRectangle])
						ifTrue: [^ Array new]]].
	^ _gsSqueakTemp_areas