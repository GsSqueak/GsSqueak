settings
windowRowsDesired
	"Answer how many separate horizontal rows of windows are wanted.
	5/22/96 sw"
	^ Preferences reverseWindowStagger
		ifTrue: [1]
		ifFalse: [self maximumUsableArea height > 480
				ifTrue: [2]
				ifFalse: [1]]