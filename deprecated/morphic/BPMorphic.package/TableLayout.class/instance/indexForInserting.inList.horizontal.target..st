utilities
indexForInserting: aPoint inList: morphList horizontal: aBool target: aMorph 
	| _gsSqueakTemp_cmp1 _gsSqueakTemp_cmp2 _gsSqueakTemp_cmp3 _gsSqueakTemp_noWrap |
	properties := aMorph layoutProperties.
	_gsSqueakTemp_noWrap := properties wrapDirection == #none.
	aBool
		ifTrue: ["horizontal"
			properties listDirection == #rightToLeft
				ifTrue: [_gsSqueakTemp_cmp1 := [:rect | aPoint x > rect left]]
				ifFalse: [_gsSqueakTemp_cmp1 := [:rect | aPoint x < rect right]].
			properties wrapDirection == #bottomToTop
				ifTrue: [_gsSqueakTemp_cmp2 := [:rect | aPoint y > rect top].
					_gsSqueakTemp_cmp3 := [:rect | aPoint y > rect bottom]]
				ifFalse: [_gsSqueakTemp_cmp2 := [:rect | aPoint y < rect bottom].
					_gsSqueakTemp_cmp3 := [:rect | aPoint y < rect top]]]
		ifFalse: ["vertical"
			properties listDirection == #bottomToTop
				ifTrue: [_gsSqueakTemp_cmp1 := [:rect | aPoint y > rect top]]
				ifFalse: [_gsSqueakTemp_cmp1 := [:rect | aPoint y < rect bottom]].
			properties wrapDirection == #rightToLeft
				ifTrue: [_gsSqueakTemp_cmp2 := [:rect | aPoint x > rect left].
					_gsSqueakTemp_cmp3 := [:rect | aPoint x > rect right]]
				ifFalse: [_gsSqueakTemp_cmp2 := [:rect | aPoint x < rect right].
					_gsSqueakTemp_cmp3 := [:rect | aPoint x < rect left]]].
	morphList
		keysAndValuesDo: [:index :m | 
			| box |
			self flag: #arNote.
			"it is not quite clear if we can really use #fullBounds here..."
			box := m fullBounds.
			_gsSqueakTemp_noWrap
				ifTrue: ["Only in one direction"
					(_gsSqueakTemp_cmp1 value: box)
						ifTrue: [^ index]]
				ifFalse: ["Check for inserting before current row"
					(_gsSqueakTemp_cmp3 value: box)
						ifTrue: [^ index].
					"Check for inserting before current cell"
					((_gsSqueakTemp_cmp1 value: box)
							and: [_gsSqueakTemp_cmp2 value: box])
						ifTrue: [^ index]]].
	^ morphList size + 1