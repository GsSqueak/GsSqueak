accessing
cursor
	"Answer the receiver's logical cursor position"
	| _gsSqueakTemp_loc |
	_gsSqueakTemp_loc := self
				valueOfProperty: #textCursorLocation
				ifAbsentPut: [1].
	_gsSqueakTemp_loc := _gsSqueakTemp_loc min: text string size.
	^ _gsSqueakTemp_loc rounded