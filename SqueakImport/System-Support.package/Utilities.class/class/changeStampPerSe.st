identification
changeStampPerSe
	"Answer a string to be pasted into source code to mark who changed it and when."
	^String streamContents:
		[ : stream | 
		self authorInitialsPerSe isEmptyOrNil
			ifTrue: [ '·' ]
			ifFalse: [ self authorInitialsPerSe ].
		stream
			 space ;
			 nextPutAll: Date today mmddyyyy ;
			 space.
		(String streamContents:
			[ : s | 
			Time now
				print24: true
				on: s ])
			copyFrom: 1
			to: 5 ]