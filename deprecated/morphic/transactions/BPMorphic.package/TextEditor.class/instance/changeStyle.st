attributes
changeStyle
	"Let user change styles for the current text pane."
	| _gsSqueakTemp_names _gsSqueakTemp_reply _gsSqueakTemp_style _gsSqueakTemp_current _gsSqueakTemp_menuList |
	_gsSqueakTemp_current := paragraph textStyle.
	_gsSqueakTemp_names := TextStyle knownTextStyles.
	_gsSqueakTemp_menuList := _gsSqueakTemp_names
				collect: [:styleName | styleName = _gsSqueakTemp_current name
						ifTrue: ['<on>' , styleName]
						ifFalse: ['<off>' , styleName]].
	_gsSqueakTemp_reply := UIManager default chooseFrom: _gsSqueakTemp_menuList values: _gsSqueakTemp_names.
	_gsSqueakTemp_reply
		ifNotNil: [(_gsSqueakTemp_style := TextStyle named: _gsSqueakTemp_reply)
				ifNil: [Beeper beep.
					^ true].
			paragraph textStyle: _gsSqueakTemp_style.
			paragraph composeAll.
			self recomputeSelection].
	^ true