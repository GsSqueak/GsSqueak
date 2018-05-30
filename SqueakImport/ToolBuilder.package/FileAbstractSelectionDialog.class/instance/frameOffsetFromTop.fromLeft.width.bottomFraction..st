ui details
frameOffsetFromTop: height fromLeft: leftFraction width: widthFraction bottomFraction: bottomFraction
	"return a layout frame that starts at the fixed upper offset and goes down to the bottomFraction, and runs widthFraction from the leftFraction"

	^LayoutFrame new
		topFraction: 0 offset: height;
		leftFraction: leftFraction offset: 0;
		rightFraction: (leftFraction + widthFraction) offset: 0;
		bottomFraction: bottomFraction offset: 0;
		yourself.