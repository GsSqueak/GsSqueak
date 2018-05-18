events-processing
selectSubmenuKey

	self isAdheringToTop ifTrue: [ ^31 ].
	self isAdheringToRight ifTrue: [ ^28 ].
	self isAdheringToLeft ifTrue: [ ^29 ].
	self isAdheringToBottom ifTrue: [ 30 ].
	^31