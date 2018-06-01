selection
selection: item 
	"Called from outside to request setting a new selection.
	Assumes scroller submorphs is exactly our list.
	Note: MAY NOT work right if list includes repeated items"
	| _gsSqueakTemp_i |
	item
		ifNil: [^ self selectionIndex: 0].
	_gsSqueakTemp_i := scroller submorphs
				findFirst: [:m | m complexContents == item].
	_gsSqueakTemp_i > 0
		ifTrue: [^ self selectionIndex: _gsSqueakTemp_i].
	_gsSqueakTemp_i := scroller submorphs
				findFirst: [:m | m withoutListWrapper = item withoutListWrapper].
	self selectionIndex: _gsSqueakTemp_i