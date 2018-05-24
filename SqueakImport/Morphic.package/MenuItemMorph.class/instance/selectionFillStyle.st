private
selectionFillStyle
	" Answer the fill style to use with the receiver is the selected element "

	| fill baseColor |
	baseColor := self userInterfaceTheme selectionColor ifNil: [Color r: 0.4 g: 0.5 b: 0.7].
	MenuMorph gradientMenu ifFalse: [ ^baseColor ].

	fill := GradientFillStyle ramp: { 
		0.0 -> baseColor thriceLighter. 
		1 -> baseColor thriceDarker }.
	fill origin: self topLeft.
	fill direction: 0 @ self height.
	^ fill