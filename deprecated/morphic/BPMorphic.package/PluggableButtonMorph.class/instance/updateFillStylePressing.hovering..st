updating
updateFillStylePressing: isPressing hovering: isHovering 
	"Migrate old instances."
	| _gsSqueakTemp_gradient _gsSqueakTemp_cc |
	hoverColor
		ifNil: [hoverColor := onColor darker].
	self
		labelOffset: (isPressing
				ifTrue: [1 @ 1]
				ifFalse: [0 @ 0]).
	self getModelState
		ifTrue: [self color: onColor]
		ifFalse: [self color: offColor].
	self borderStyle color: borderColor.
	self wantsGradient
		ifFalse: [isPressing
				ifTrue: [self color: feedbackColor.
					self borderStyle color: feedbackColor muchDarker].
			isHovering
				ifTrue: [self color: hoverColor.
					self borderStyle color: borderColor].
			^ self].
	isPressing
		ifTrue: [_gsSqueakTemp_cc := feedbackColor.
			self borderColor: feedbackColor muchDarker.
			_gsSqueakTemp_gradient := GradientFillStyle ramp: {0.0 -> _gsSqueakTemp_cc muchDarker. 0.1
							-> (_gsSqueakTemp_cc adjustBrightness: -0.2). 0.5 -> _gsSqueakTemp_cc. 0.9
							-> (_gsSqueakTemp_cc adjustBrightness: -0.1). 1 -> _gsSqueakTemp_cc muchDarker}].
	isHovering
		ifTrue: [_gsSqueakTemp_cc := hoverColor.
			_gsSqueakTemp_gradient := GradientFillStyle ramp: {0.0 -> Color white. 0.1
							-> (_gsSqueakTemp_cc adjustBrightness: 0.05). 0.6 -> _gsSqueakTemp_cc darker}].
	_gsSqueakTemp_gradient
		ifNil: [_gsSqueakTemp_cc := self color.
			_gsSqueakTemp_gradient := GradientFillStyle ramp: {0.0 -> Color white. 0.1
							-> (_gsSqueakTemp_cc adjustBrightness: 0.05). 0.6 -> _gsSqueakTemp_cc darker}].
	_gsSqueakTemp_gradient origin: bounds topLeft.
	_gsSqueakTemp_gradient direction: 0 @ self height.
	self fillStyle: _gsSqueakTemp_gradient