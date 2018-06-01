updating
updateSliderColorGradient: aColor 
	| _gsSqueakTemp_gradient _gsSqueakTemp_cc |
	pagingArea
		color: ((self userInterfaceTheme pagingAreaColorModifier
				ifNil: [[:c | c darker alpha: 0.35]])
				value: aColor).
	slider
		borderColor: ((self userInterfaceTheme borderColorModifier
				ifNil: [[:c | c adjustBrightness: -0.3]])
				value: aColor).
	_gsSqueakTemp_cc := (self userInterfaceTheme thumbColorModifier
				ifNil: [[:c | c]])
				value: aColor.
	_gsSqueakTemp_gradient := GradientFillStyle ramp: {0.0 -> Color white. 0.1
					-> (_gsSqueakTemp_cc adjustBrightness: 0.05). 0.6 -> _gsSqueakTemp_cc darker}.
	"Fill the thumb"
	_gsSqueakTemp_gradient origin: slider topLeft.
	_gsSqueakTemp_gradient
		direction: (self orientation == #horizontal
				ifTrue: [0 @ slider height]
				ifFalse: [slider width @ 0]).
	slider fillStyle: _gsSqueakTemp_gradient.
	"Fill the buttons"
	{self menuButton. self upButton. self downButton}
		do: [:ea | 
			_gsSqueakTemp_gradient := _gsSqueakTemp_gradient copy.
			_gsSqueakTemp_gradient origin: ea topLeft.
			_gsSqueakTemp_gradient
				direction: (self orientation == #horizontal
						ifTrue: [0 @ ea height]
						ifFalse: [ea width @ 0]).
			ea fillStyle: _gsSqueakTemp_gradient;
				 borderWidth: slider borderWidth;
				 borderColor: slider borderColor]