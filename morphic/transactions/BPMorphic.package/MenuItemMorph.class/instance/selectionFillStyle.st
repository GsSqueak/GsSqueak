private
selectionFillStyle
	"Answer the fill style to use with the receiver is the selected element"
	| _gsSqueakTemp_fill _gsSqueakTemp_baseColor |
	_gsSqueakTemp_baseColor := self userInterfaceTheme selectionColor
				ifNil: [Color
						r: 0.4
						g: 0.5
						b: 0.7].
	MenuMorph gradientMenu
		ifFalse: [^ _gsSqueakTemp_baseColor].
	_gsSqueakTemp_fill := GradientFillStyle ramp: {0.0 -> _gsSqueakTemp_baseColor twiceLighter. 1 -> _gsSqueakTemp_baseColor twiceDarker}.
	_gsSqueakTemp_fill origin: self topLeft.
	_gsSqueakTemp_fill direction: 0 @ self height.
	^ _gsSqueakTemp_fill