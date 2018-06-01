accessing - ui
sliderShadowColor

	^ ((self userInterfaceTheme thumbShadowModifier
			ifNil: [ [:c | c alpha: 0.7 ] ]) value: self sliderColor)