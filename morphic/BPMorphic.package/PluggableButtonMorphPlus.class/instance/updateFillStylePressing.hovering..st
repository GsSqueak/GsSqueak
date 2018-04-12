initialize-release
updateFillStylePressing: isPressing hovering: isHovering 
	enabled
		ifFalse: [self
				color: (disabledColor
						ifNil: [Color transparent]).
			self borderStyle color: disabledTextColor.
			^ self].
	super updateFillStylePressing: isPressing hovering: isHovering