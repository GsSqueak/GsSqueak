drawing
maxExtent: listOfStrings

	| h maxW |
	maxW := 0.
	listOfStrings do: [:str | | f w |
		f := self fontToUse.
		w := f widthOfString: str.
		h := f height.
		maxW := maxW max: w].
	self extent: (maxW + 4 + h) @ (h + 4).
	self changed