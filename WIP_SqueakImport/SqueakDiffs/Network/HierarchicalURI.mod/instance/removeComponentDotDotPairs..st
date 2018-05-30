private
removeComponentDotDotPairs: pathComponents
	| dotDotIndex |
	dotDotIndex := pathComponents indexOf: '..'.
	[dotDotIndex > 1]
		whileTrue: [
			pathComponents
				removeAt: dotDotIndex;
				removeAt: dotDotIndex-1.
			dotDotIndex := pathComponents indexOf: '..']