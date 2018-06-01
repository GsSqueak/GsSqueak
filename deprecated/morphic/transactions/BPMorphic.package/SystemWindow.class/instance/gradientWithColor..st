colors
gradientWithColor: aColor 
	| _gsSqueakTemp_gradient _gsSqueakTemp_cc |
	_gsSqueakTemp_cc := aColor adjustSaturation: -0.08 brightness: 0.4.
	_gsSqueakTemp_gradient := GradientFillStyle ramp: {0.0
					-> (self isKeyWindow
							ifTrue: [_gsSqueakTemp_cc muchLighter]
							ifFalse: [_gsSqueakTemp_cc]). 0.25
					-> (aColor mixed: 0.5 with: _gsSqueakTemp_cc). 1.0 -> aColor}.
	_gsSqueakTemp_gradient origin: self topLeft.
	_gsSqueakTemp_gradient direction: 0 @ self labelHeight.
	^ _gsSqueakTemp_gradient