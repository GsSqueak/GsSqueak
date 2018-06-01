layout
minWidth
	| iconWidth |
	iconWidth := self hasIcon
				ifTrue: [self icon width + 2]
				ifFalse: [0].
	^ (self fontToUse widthOfString: contents)
		+ iconWidth 