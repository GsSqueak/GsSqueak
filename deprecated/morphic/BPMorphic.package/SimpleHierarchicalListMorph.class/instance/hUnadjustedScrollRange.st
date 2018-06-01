scrolling
hUnadjustedScrollRange
	"Return the width of the widest item in the list"
	| _gsSqueakTemp_max _gsSqueakTemp_count |
	_gsSqueakTemp_max := 0.
	_gsSqueakTemp_count := 0.
	scroller
		submorphsDo: [:each | 
			| stringW right |
			stringW := each font widthOfStringOrText: each contents.
			right := each toggleRectangle right + stringW + 10.
			_gsSqueakTemp_max := _gsSqueakTemp_max max: right.
			"NOTE: need to optimize this method by caching list item
			morph widths (can init that cache most efficiently in the #list:
			method before the item widths are reset to 9999). For now,
			just punt on really long lists"
			(_gsSqueakTemp_count := _gsSqueakTemp_count + 1) > 200
				ifTrue: [^ _gsSqueakTemp_max * 3]].
	^ _gsSqueakTemp_max