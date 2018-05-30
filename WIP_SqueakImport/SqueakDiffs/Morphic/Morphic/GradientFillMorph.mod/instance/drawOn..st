drawing
drawOn: aCanvas 
	"Note that this could run about 4 times faster if we got hold of
	the canvas's port and just sent it copyBits with new coords and color"

	| style |
	super drawOn: aCanvas.
	(color isColor) ifFalse: [^self].	"An InfiniteForm, for example"
	color = Color transparent ifTrue: [^self].	"Skip the gradient attempts, which will drop into debugger"
	color = fillColor2 ifTrue: [^self].	"same color; no gradient"
	"Check if we can use the cached gradient fill"
	((self valueOfProperty: #cachedGradientColor1) = color 
		and: [(self valueOfProperty: #cachedGradientColor2) = fillColor2]) 
			ifTrue: [style := self valueOfProperty: #cachedGradientFill].
	style ifNil: 
			[style := GradientFillStyle ramp: { 
								0.0 -> color.
								1.0 -> fillColor2}.
			self setProperty: #cachedGradientColor1 toValue: color.
			self setProperty: #cachedGradientColor2 toValue: fillColor2.
			self setProperty: #cachedGradientFill toValue: style].
	style origin: self position.
	style direction: (gradientDirection == #vertical 
				ifTrue: [0 @ self height]
				ifFalse: [self width @ 0]).
	aCanvas fillRectangle: self innerBounds fillStyle: style