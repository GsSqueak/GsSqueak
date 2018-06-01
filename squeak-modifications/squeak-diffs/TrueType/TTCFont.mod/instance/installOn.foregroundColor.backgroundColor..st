friend
installOn: aDisplayContext foregroundColor: fgColor backgroundColor: bgColor
	self foregroundColor: fgColor. "install color"
	(self fallbackFont notNil and: [ self fallbackFont class = TTCFontSet ]) ifTrue: [
		self fallbackFont fontArray do: [:font |
			font ifNotNil: [ font foregroundColor: fgColor ]
		]
	].  "install color for fallbackFont"
	aDisplayContext installTTCFont: self foregroundColor: foregroundColor backgroundColor: bgColor
