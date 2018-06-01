accessing
measureContents
	| f |
	f := self fontToUse.
	^(((f widthOfString: contents) max: self minimumWidth)  @ f height).