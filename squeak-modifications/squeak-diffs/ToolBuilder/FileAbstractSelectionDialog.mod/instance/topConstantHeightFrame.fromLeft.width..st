ui details
topConstantHeightFrame: height fromLeft: leftFraction width: widthFraction
	"return a layout to make a fixed height frame that starts at the top of its parent and runs widthFraction from the leftFraction."

	^LayoutFrame new
		topFraction: 0 offset: 0;
		leftFraction: leftFraction offset: 0;
		rightFraction: (leftFraction + widthFraction) offset: 0;
		bottomFraction: 0 offset: height;
		yourself.