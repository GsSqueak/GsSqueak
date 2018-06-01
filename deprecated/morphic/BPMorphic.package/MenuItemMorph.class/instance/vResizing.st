layout-properties
vResizing
	"Default to #shrinkWrap"
	| _gsSqueakTemp_props |
	_gsSqueakTemp_props := self layoutProperties.
	^ _gsSqueakTemp_props
		ifNil: [#shrinkWrap]
		ifNotNil: [_gsSqueakTemp_props vResizing]