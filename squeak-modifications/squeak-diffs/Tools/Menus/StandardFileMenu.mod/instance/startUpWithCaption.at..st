basic control sequences
startUpWithCaption: aString at: location

	|result|
	result := super startUpWithCaption: aString at: location.
	result ifNil: [^nil].
	result isDirectory ifTrue:
		[self makeFileMenuFor: result directory.
		 self computeForm.
		 ^self startUpWithCaption: aString at: location].
	result isCommand ifTrue: 
		[result := self getTypedFileName: result.
		result ifNil: [^nil]].
	canTypeFileName ifTrue: [^self confirmExistingFiles: result].
	^result
	