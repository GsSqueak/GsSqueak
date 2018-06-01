geometry
charactersOccluded
	"Answer the number of characters occluded in my #visibleList by my
	right edge."
	| _gsSqueakTemp_listIndex |
	_gsSqueakTemp_listIndex := 0.
	^ self visibleList
		inject: 0
		into: [:sum :each | 
			| eachString totalWidth indexOfLastVisible iconWidth |
			totalWidth := 0.
			eachString := each asString.
			"withBlanksTrimmed"
			iconWidth := (self iconAt: (_gsSqueakTemp_listIndex := _gsSqueakTemp_listIndex + 1))
						ifNil: [0]
						ifNotNil: [:icon | icon width + 2].
			indexOfLastVisible := ((1 to: eachString size)
						detect: [:stringIndex | (totalWidth := totalWidth
										+ (self font
												widthOf: (eachString at: stringIndex))) > (self width
									- (scrollBar
											ifNil: [0]
											ifNotNil: [scrollBar width]) - iconWidth)]
						ifNone: [eachString size + 1])
						- 1.
			sum
				+ (eachString size - indexOfLastVisible min: 10)]