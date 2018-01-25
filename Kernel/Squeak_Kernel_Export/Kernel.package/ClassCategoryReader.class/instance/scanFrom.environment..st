fileIn/Out
scanFrom: aStream environment: anEnvironment
	"File in methods from the stream, aStream."
	| methodText |
	[methodText := aStream nextChunkText.
	 methodText size > 0] whileTrue:
		[class 
			compile: methodText 
			environment: anEnvironment
			classified: category
			withStamp: changeStamp 
			notifying: nil]