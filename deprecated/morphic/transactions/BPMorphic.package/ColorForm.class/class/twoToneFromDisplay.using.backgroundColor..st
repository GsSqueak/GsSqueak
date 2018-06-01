as yet unclassified
twoToneFromDisplay: aRectangle using: oldForm backgroundColor: bgColor 
	"Return a 1-bit deep ColorForm copied from the given rectangle of the
	display. All colors except the background color will be mapped to
	black. "
	| _gsSqueakTemp_f |
	(oldForm ~~ nil
			and: [oldForm extent = aRectangle extent])
		ifTrue: [_gsSqueakTemp_f := oldForm fromDisplay: aRectangle]
		ifFalse: [_gsSqueakTemp_f := ColorForm extent: aRectangle extent depth: 1.
			_gsSqueakTemp_f twoToneFromDisplay: aRectangle backgroundColor: bgColor.
			_gsSqueakTemp_f
				colors: (Array with: bgColor with: Color black)].
	^ _gsSqueakTemp_f