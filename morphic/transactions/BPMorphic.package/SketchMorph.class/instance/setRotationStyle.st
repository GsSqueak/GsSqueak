menu
setRotationStyle
	| _gsSqueakTemp_selections _gsSqueakTemp_labels _gsSqueakTemp_sel _gsSqueakTemp_reply |
	_gsSqueakTemp_selections := #(#normal #leftRight #upDown #none ).
	_gsSqueakTemp_labels := #('rotate smoothly' 'left-right flip only' 'top-down flip only' 'don''t rotate' ).
	_gsSqueakTemp_sel := _gsSqueakTemp_labels
				at: (_gsSqueakTemp_selections
						indexOf: self rotationStyle
						ifAbsent: [1]).
	_gsSqueakTemp_labels := _gsSqueakTemp_labels
				collect: [:lbl | _gsSqueakTemp_sel = lbl
						ifTrue: ['<on>' , lbl translated]
						ifFalse: ['<off>' , lbl translated]].
	_gsSqueakTemp_reply := UIManager default chooseFrom: _gsSqueakTemp_labels values: _gsSqueakTemp_selections.
	_gsSqueakTemp_reply
		ifNotNil: [self rotationStyle: _gsSqueakTemp_reply]