geometry
bottomVisibleRowIndex
	| _gsSqueakTemp_itemAtBottom |
	_gsSqueakTemp_itemAtBottom := self itemFromPoint: self bottomLeft + (3 @ -3).
	^ _gsSqueakTemp_itemAtBottom
		ifNil: [scroller submorphs size]
		ifNotNil: [:item | scroller submorphs indexOf: item]