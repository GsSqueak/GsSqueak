private
asFrame: aRectangle
	| frame |
	aRectangle ifNil:[^nil].
	frame := LayoutFrame new.
	frame 
		leftFraction: aRectangle left; 
		rightFraction: aRectangle right; 
		topFraction: aRectangle top; 
		bottomFraction: aRectangle bottom.
	^frame