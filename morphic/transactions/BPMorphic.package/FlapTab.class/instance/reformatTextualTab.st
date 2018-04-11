textual tabs
reformatTextualTab
	"The font choice possibly having changed, reformulate the receiver"
	self isCurrentlyTextual
		ifFalse: [^ self].
	self
		assumeString: self existingWording
		font: Preferences standardFlapFont
		orientation: self orientation
		color: self color