sound-piano rolls
myDurationInMS

	^tape isEmptyOrNil ifTrue: [
		10
	] ifFalse: [
		tape last timeStamp - tape first timeStamp
	]
