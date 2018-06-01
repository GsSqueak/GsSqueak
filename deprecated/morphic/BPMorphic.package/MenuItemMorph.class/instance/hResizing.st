layout-properties
hResizing
	"Default to #spaceFill"
	| _gsSqueakTemp_props |
	_gsSqueakTemp_props := self layoutProperties.
	^ _gsSqueakTemp_props
		ifNil: [#spaceFill]
		ifNotNil: [_gsSqueakTemp_props hResizing]