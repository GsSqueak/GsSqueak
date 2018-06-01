updating
updateSliderColorSolid: aColor

	sliderShadow color: self sliderShadowColor.

	slider color: ((self userInterfaceTheme thumbColorModifier
		ifNil: [ [:c | c] ]) value: aColor).

	slider borderColor: ((self userInterfaceTheme borderColorModifier
		ifNil: [ [:c | c adjustBrightness: -0.3] ]) value: aColor).

	pagingArea color: ((self userInterfaceTheme pagingAreaColorModifier
		ifNil: [ [:c | c darker alpha: 0.35] ]) value: aColor).
		
	{self menuButton. self upButton. self downButton} do: [:ea |
		ea
			color: slider color;
			borderWidth: slider borderWidth;
			borderColor: slider borderColor].