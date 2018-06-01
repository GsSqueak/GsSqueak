setting
setTargetColor: aColor
	"Set my target's color as indicated"

	putSelector ifNotNil:
		[self color: aColor.
		contents := aColor.
		self valueProvider perform: self putSelector withArguments: (Array with: aColor)]
