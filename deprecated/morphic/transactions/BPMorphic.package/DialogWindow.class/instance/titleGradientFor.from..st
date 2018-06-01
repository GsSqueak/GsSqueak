initialization
titleGradientFor: morph from: aColor 
	| _gsSqueakTemp_cc _gsSqueakTemp_gradient |
	_gsSqueakTemp_cc := aColor.
	_gsSqueakTemp_gradient := GradientFillStyle ramp: {0.0 -> Color white. 0.15
					-> (_gsSqueakTemp_cc mixed: 0.5 with: Color white). 0.7 -> _gsSqueakTemp_cc}.
	_gsSqueakTemp_gradient origin: morph topLeft.
	_gsSqueakTemp_gradient direction: 0 @ (TextStyle defaultFont height + 10).
	^ _gsSqueakTemp_gradient