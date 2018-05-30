colors
refreshWindowColor
	"For changing the underlying model's default window color"
	self setProperty: #paneColor toValue: nil.
	self setWindowColor: self paneColor.

	self isLookingFocused
		ifTrue: [self lookUnfocused; lookFocused]
		ifFalse: [self lookFocused; lookUnfocused].