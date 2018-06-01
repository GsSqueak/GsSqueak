menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'gradient color' translated action: #setGradientColor:.
	gradientDirection == #vertical
		ifTrue: [aCustomMenu add: 'horizontal pan' translated action: #beHorizontal]
		ifFalse: [aCustomMenu add: 'vertical pan' translated action: #beVertical].
