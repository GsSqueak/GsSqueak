cursor
showTemporaryCursor: cursorOrNil hotSpotOffset: hotSpotOffset
	"When I show my cursor, it appears double size,
	unless it is a form such as a paint brush."

	cursorOrNil
	ifNil: ["Setting cursor to nil cannot revert to hardware cursor -- just show normal."
			^ self showTemporaryCursor: Cursor normal hotSpotOffset: Cursor normal offset]
	ifNotNil:
		[(cursorOrNil isKindOf: Cursor)
			ifTrue: ["Show cursors magnified for visibility"
					^ super showTemporaryCursor: (cursorOrNil asCursorForm magnifyBy: 2)
				 				hotSpotOffset: (cursorOrNil offset negated*2) + hotSpotOffset]
			ifFalse: [^ super showTemporaryCursor: cursorOrNil
				 				hotSpotOffset: hotSpotOffset]]